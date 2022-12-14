package ru.yandex.practicum.filmorate;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.function.Executable;
import ru.yandex.practicum.filmorate.model.Film;
import ru.yandex.practicum.filmorate.model.Mpa;
import validation.Validation;

import java.time.LocalDate;

public class FilmValidationTest {
    private final Validation validation = new Validation();
    private Film film;

    @BeforeEach
    public void createTestFilm() {
        film = new Film(2,"name", LocalDate.of(2001,06,05), "description",
                85, new Mpa(1,"G"));
    }

    @Test
    public void createFilmEmptyNameTest() {
        film.setName("");
        final RuntimeException exception = Assertions.assertThrows(RuntimeException.class, new Executable() {
            @Override
            public void execute() throws Throwable {
                validation.validationFilm(film);
            }
        });
        Assertions.assertEquals("В названии фильма ничего не указано",
                exception.getMessage(), "сообщение об исключении не совпало");
    }

    @Test
    public void createFilmBeforeDateTest() {
        film.setReleaseDate(LocalDate.of(1894,04,12));
        final RuntimeException exception = Assertions.assertThrows(RuntimeException.class, new Executable() {
            @Override
            public void execute() throws Throwable {
                validation.validationFilm(film);
            }
        });
        Assertions.assertEquals("Дата выхода фильма не может быть раньше 28.12.1895г",
                exception.getMessage(), "сообщение об исключении не совпало");
    }

    @Test
    public void createFilmOver200SimbolsTest() {
        film.setDescription("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
                "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
                "aaaaaaaaaaaaaaa");
        final RuntimeException exception = Assertions.assertThrows(RuntimeException.class, new Executable() {
            @Override
            public void execute() throws Throwable {
                validation.validationFilm(film);
            }
        });
        Assertions.assertEquals("В описании фильма больше 200 символов",
                exception.getMessage(), "сообщение об исключении не совпало");
    }

    @Test
    public void createFilmNegativeDurationTest() {
        film.setDuration(-5);
        final RuntimeException exception = Assertions.assertThrows(RuntimeException.class, new Executable() {
            @Override
            public void execute() throws Throwable {
                validation.validationFilm(film);
            }
        });
        Assertions.assertEquals("Продолжительность фильма не может быть отрицательной",
                exception.getMessage(), "сообщение об исключении не совпало");
    }
}
