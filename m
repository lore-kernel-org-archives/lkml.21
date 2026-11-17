Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794937360;
	b=zc+GrSAxyX+/6+aHxr5pRYAHPzl5f8umHHahUebb6ndp0anh6UGUm2DGrXGE7iS2ebqy
	 yBl89ezOWp3J25EFWn4fitRRSkMhaU3r6GkC3KqsTUDrWGb8f6KPQ2uRuvDqk9dN9woLz
	 gIaq9FAG0SiWhBx+8gT+mcO+TGEN4Jm5Jp7as+YsJ3r2otl8oYschMOe8L8XYY5Xy1N6E
	 voI4FL0d9PrBNO03z+CQk8bdqdKxo2Ely26gKUVmhoHsswKyvb9l4Ys/t4UdODwxaYUum
	 pIdre92t1VgUKcKSU4HAJWiEoKyLc87UXX5+jy5pZ2B0P0boHmkjvizNEnk4nzrR1Pg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=C0Br6uNbCeSZG/D0SaMC7uBQz4y4PQvjObMC5HHmvxw=;
	b=tx+7Kmbr3X4dGmZ1wU8usWlZmnGvalus8b5jFx1TlHt400Wb3JGf5eF8kW5h1NmSGeFY
	 vM8mMS8pX4tDiXSuF72Fwu7BEl98Y4wPdeAzHef+K7D23l8vKUmqHWSouHd1eooBoELEs
	 9RWMFI0F1p968WjJY8vyvegV4GUg/woQljWQ2lFEmcEmlUf183o/YemzCoJTLbqveP0dW
	 Yzlla2yJHae9N9bFzbnhQKezYS6dBEfjnQFqnnrozqsQBFZJCbzxkivt2UHXYD+yURwbk
	 Ugx8LQM77nJN4qSJ7Q3rDLM++ulzpXGjYplKmrhGuAM+xbcW3znKbUScmjg0wPM0B8g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=amacapital.net;
	spf=pass smtp.mailfrom=amacapital.net;
	dkim=pass header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=EEvWGAFb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EA9606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:42:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90EA9606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=EEvWGAFb
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5bfbc67991cso21709e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:42:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794937359; cv=none;
        d=google.com; s=arc-20260327;
        b=mGbAPt71bsx3D7dvcoghPdGrH0ykl9ZBs6mEgndYCISbinMeUs7aJnySTqh79sciy4
         kCHz4t2w6Ar4RZN9depJuQJ8yghWDTdpvcFhjH7veOF3sX9/EDGmh4Tst96mncVVq43P
         dzlXQ3itVsWjJS9/i4otB/2OtvJhhvhwjJfhGUdjihcGMNriGhtuYEaeoNkOHeAKCJaK
         ADpA7v4BexfrB0S+Tpto9C4ds3nJL8jkf8fq0y4vvjcVt25yf1eVH9ZaB8oztYTsRVdZ
         HV6EyirD8ooaLLb9lnsM7FZEHSwADm88ZucFmMzt3URVyZVJhbl2uhapgrc59gPA3mcC
         4JAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C0Br6uNbCeSZG/D0SaMC7uBQz4y4PQvjObMC5HHmvxw=;
        fh=WAET+SiewUKqPQBDNKe9b96q7TmPE5Wp7ZzJBt2sk98=;
        b=QSJYwV2e317nG77esVruBOyQNz3BbLVulpzn1tNTf2P1eH75eav1ThZZqLS1RjSckI
         opa6DLJCWrJ1genFzZgLmzGkE25VfRTRbJExKzQz+po/F3t+2PkiM2JcKHHhDkxyDPsL
         gto8ekJ5PBpfrvOv7CkeIdS4hVDfAQvuEHIo3DRBFqpA/S7fIkNaItj9rhfIuSSAUqDB
         EC1nQAFXNC1AaGp5Twj/E0AKEVyIo+l+doUdLlVsw1pBmyT1RL+e1QjzgOJKGWp597h7
         DXdXXhaqLMoyO2jbYHjGCCAN7gTARGio5rHNjGTi5/wH6aL2E1Wh5aHmHK6Q5ssKb5S5
         Njkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20260707.gappssmtp.com; s=20260707; t=1794937359; x=1795542159; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C0Br6uNbCeSZG/D0SaMC7uBQz4y4PQvjObMC5HHmvxw=;
        b=EEvWGAFbOmPz0e1bruaOl0rjybH0s4KDHt1ZdsIprIDdOYSYYFkdgv0P5ZbqLm9wOt
         QUKZ38KmXI7yBp+GV0/eyJrlR0x9jaOEr3Ii55nnjpnVrQIiwkaoActJokk0nmQSZd7G
         61WKKrB70e3ufmKjp4oHO9TAABVl1efKkOpBvtOYK6RF6gVHy0E+rjZz0xIx57DanHDh
         1TInlFBGPv/IJYMg1cTj312Sc7q2gHY8Ugtu6+Jpk/LKIOoiULHPpgJvsVB0ghEN1g8q
         2dPQMdyQdgbZ8hjQrp+yJxxt3I0107KE+viwJ2hHYYVk4FGOG+dWGVAy9wgHIHfa0LWA
         TeLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937359; x=1795542159;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C0Br6uNbCeSZG/D0SaMC7uBQz4y4PQvjObMC5HHmvxw=;
        b=nWKbZepZgKQHOftPhDR8wheICGd86wArvTOE5eorejlVvAPz5CV/laN4tO1Db49FKo
         O+Baol4UsaL5gbWv8UvxPiOw3FntPu1rcxCVEHCbYsGx/J+O8rPQwKJv1LDvns78GYrS
         F5ZasB4193/PisvPc/AgVHoTiIa3EGMBTMaBXeCvr6eQZhnGCAFK9XMu5UEjGLlIZWVb
         CKfMJMGGHiy8cJwM/8jnwXPS2NvUcGq7oOrNz/3F20MUONDyJbwMDXO4Vh7jbE3tJTf4
         CJYznCDZP1b9pO2Y+SLtM+YrvOzijPtnJ1YO2QydyhE7UHxCVvnEzmX46ToDQrXI6uHQ
         dWcg==
X-Forwarded-Encrypted: i=1; AL+hErEiVPY9PYFx/8lUtFIKm6oEFaSaHxDBzxWUisDdvsrAGCXwZu7eRZOBOK7YZuvK8P3mjbbVsbiU93/Kxm0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ygwhp8wJpsc2FNyg6oLWvMyhUSMe2NYwIT0yjUomFCSfidBK+
	opdULh0hHiOBeVcVGPltTPKUBWMs0Myu/EgLFeaxQ+/maVNNaZucNfkC/YplOXWXcTKHW9vx4PF
	0Lj8iRaWVQ+bKx6RCKWcVigzpjHfPYHYg1TI6UVSC
X-Gm-Gg: AYBFou1mR+Tc0UT4VSUkYhwnymWZBLPIQrnukDL/DzWVhACraJ5mkAAYRpsoS9VeIoz
	4MLj4iZsM2tzkzMxmsGKpJsuRuEjWKfc2HKA86XTI5Og9HQr8p0Kj1VPdZcceMnMOiLbWBoB7IX
	G76IjT6z1HpnYDX9VwMh8XAGFsQL9bUIYC5CXFuX0BgNKXIQZuWKPHlVOV/6Ts8JSuIwpGEYgvz
	wO7Tb4aKYrbCJiR65a/Cup+j/b3UAgQnuvxb8JLbVG2ElckQOC1NCuhkB7t3y5AkenGMWGuK+mE
	Hj+9W9GS5F99QhaJS7kZCY7Zx7lv213l6YRydevyCI9LJmrVD00k5xFRfQTbiTbAz1KSByH3buI
	KjvFZTSem16lELVPFH4AnUK7fZv6KG95SEw==
X-Received: by 2002:ac2:4bc9:0:b0:5c1:4ccf:f0b8 with SMTP id
 2adb3069b0e04-5c170a0bb3cmr7252657e87.16.1794937358574; Tue, 17 Nov 2026
 09:42:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117050841.3289652-1-jarkko@kernel.org> <20261117050841.3289652-8-jarkko@kernel.org>
In-Reply-To: <20261117050841.3289652-8-jarkko@kernel.org>
From: Andy Lutomirski <luto@amacapital.net>
Date: Tue, 17 Nov 2026 09:42:26 -0800
X-Gm-Features: Aa3M54o6AJsup2EB_D5C3UIkkriS8wK22wW9apyv8KKATx5_DoWBh2HrH9mfDyU
Message-ID: <CALCETrWtbUFQGDOCHkxAN9O4i29ixfL5KKF1Cqw2-CjxKwC6gQ@mail.gmail.com>
Subject: Re: [RFC PATCH 07/13] rootns: Add rootns_enter() system call
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, 
	Ben Segall <bsegall@google.com>, Christian Brauner <brauner@kernel.org>, 
	David Hildenbrand <david@kernel.org>, David Howells <dhowells@redhat.com>, 
	Davidlohr Bueso <dave@stgolabs.net>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Ingo Molnar <mingo@redhat.com>, Jan Kara <jack@suse.cz>, Jonathan Corbet <corbet@lwn.net>, 
	Juri Lelli <juri.lelli@redhat.com>, Kees Cook <kees@kernel.org>, 
	K Prateek Nayak <kprateek.nayak@amd.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Manfred Spraul <manfred@colorfullife.com>, Mel Gorman <mgorman@suse.de>, 
	Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, Neal Gompa <neal@gompa.dev>, 
	Paul Moore <paul@paul-moore.com>, Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, 
	Peter Zijlstra <peterz@infradead.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Serge Hallyn <sergeh@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Suren Baghdasaryan <surenb@google.com>, 
	Valentin Schneider <vschneid@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Vlastimil Babka <vbabka@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 9:09=E2=80=AFPM Jarkko Sakkinen <jarkko@kernel.org>=
 wrote:
>
> Multithreaded userspace daemons cannot call setns(CLONE_NEWUSER) or
> safely mutate process-wide filesystem state in place before spawning a
> child into a target namespace set.
>
> Add the rootns_enter() system call to fork a child process directly into
> a rootns whose root mount has been installed. Transition the rootns from
> ROOTNS_READY through ROOTNS_FORKING to ROOTNS_RUNNING for the first
> process so it becomes PID 1, serialize concurrent entrants on waitq
> until bootstrap resolves, and admit subsequent callers into the running
> PID namespace until teardown begins.
>
> Require CAP_SYS_ADMIN in the target user namespace, forbid credential or
> PR_SET_NO_NEW_PRIVS privilege escalation

Why are you disallowing this if no_new_privs?

This isn't necessarily a showstopper, but fork() is really quite slow
in many cases.  It would be nice to have a more spawn-like API
available.  I assume it's possible to open a file in the target's
mountns by some sane API even without entering that mountns, as a side
effect of how the fsopen / move_mount mechanism works.

--Andy
