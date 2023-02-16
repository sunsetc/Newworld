package xyz.tour.newworld.anno;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

import java.lang.annotation.Target;

@Target(ElementType.METHOD) //메소드 위 또는 메소드()(변수 앞)안에만 사용가능
@Retention(RetentionPolicy.RUNTIME)  //유지를 runtime일때만 가능
public @interface CheckAuth {
}

/*
 * @Target 어노테이션은 해당 어노테이션이 어디에 사용될 수 있는지를 제한한다 ElementType.METHOD를 사용하였기 때문에,
 * 해당 어노테이션은 메소드 위쪽 또는 메소드() 안에만 사용 할 수 있다.
 * 
 * @Retention 어노테이션은 해당 어노테이션의 유지 정책을 정의한다. RetentionPolicy.RUNTIME을 사용하였기 때문에,
 * 어노테이션은 실행 중에만 유지되며, 컴파일 후에는 제거 된다.
 * 
 * @interface는 어노테이션을 정의할 때 사용하는 키워드이다. 위의 코드는 @CheckAuth 어노테이션을 정의하고 있다. 어노테이션을
 * 사용하면, 특정 속성을 가진 코드에 메타 데이터를 추가하거나 특정 기능을 수행할 수 있다.
 */