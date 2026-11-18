Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795007464;
	b=NX/O4Bg4KU+Q6riBIYJfP5zSI1lmozStwPp0ldu5MMws0cxE7nRTXGPKQgd5CYdrK2n0
	 sAg6ZEakqmvIDXCUg30qZT0Ub3a9Y+F+Vd0Nw7q6X8Vl+37i0QoBBWLsUfIW6mzND2sc3
	 qMJ5AN8dCVyYXM6L/ZLDHVE2vaKI9QlnD5IxKzdZOtQ0Tu1iqjnwfMrMd6wHmnGge2sI3
	 FTSvbUtMwg3/QLL0FzfNG9bykfvpLo/CmNVxpN9oYNeWbis44lrm3hy4ZMtkOlkg7xYSj
	 2/jLJ6C/1V/v/3Ts3Riz89lJFHVsi6DuH6h4pPAsdci/hP3EzGnDe8Eky5cIrQrfQcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795007464;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Jkc5vxUell4DJGLRsmUzNdnS1FjaSDbl1xaX6eVk0/g=;
	b=OrlFpljaZT62tBKXehLIeRT/a+so9E+V9ad5lMQ6MGQ5AfSPEjyEw+Flcd0c+xl/d1mG
	 olkYspnRxNYLz+aQ6yv4T6fmxwaqRhj8018WBxVfN/vNfmQJNWTLAJMUsNFknCblyHFyf
	 ADm+NhTT/T6IIFSQZO+oV6n/Fr4JLbySlpOyzK/tIV5Fyh9z3kKfc5YStQI4bhmD/zple
	 t+uPg78pEq0iv1fBPkUyshZkxqX6WFu6svmZk+53fP9pKwuBmKW45E+qMM7oH1eL4vtYF
	 sH2UGqX/BOqxOAQdJ8qz90EayyoD+cBuQRp5TfsDQF4ScP78OAIiJOFZCAy0cvC5Unw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TkAj02s+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81800606A334
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TkAj02s+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D99A1F000D0
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795007464;
	bh=Jkc5vxUell4DJGLRsmUzNdnS1FjaSDbl1xaX6eVk0/g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=TkAj02s+lgjnpJuRM4doMFA9llt7oJYX8EFWS01/Ctr6hGS/avaTz9nhD4IZ6zYLt
	 53j5nt55FHJmR3HXkQcGwS1ulLQceDBXFQI3mLOfQHVXQtgSq7p3WV+gfFMQ6aFaGC
	 16uYJ3bZth43q6BIBzrVwrLAeSMVwhs2qcxrsWmNaD9ri+5mSVkmQZrMZ0ctsaBY6Q
	 qO5AkGrAWmr01HuCzom0w5HRb/Bw4/xb3B671vTPjLn9JRAmEWjkYKAGhY12lD784l
	 E8EtGUQ1viQy0OeB0wHmzY4TTyXSLbCHtzQCYgLZ38NeovqaQWWpbc+hWnR8KCBtlX
	 DQ5LdTSiBXv2w==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so1025704e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 05:11:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHF4mKTCulW8hnEAwAIBOGY6QJ2Sz8hF770gysfSxPhjrQauPGA7LPUB+YQh6lWrjWOo+cMDjM7q+CakhQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6GU2bte2Q8oGBiVUuyqdWqUHEA36EcGmy9miS2YT3ddKQF7EX
	fRTFqkdXrwcqUl1tEh/DB800X2iMnnTcDoX8jpgMcXNo+QtxraRNEB/tERntHCBAV6V5Qd1tdLo
	YSbM0lREE88hM5WoowNQtTu0wk4wfCv0=
X-Received: by 2002:a05:6512:6602:b0:5c1:ac60:3c65 with SMTP id
 2adb3069b0e04-5c1ac603de3mr550322e87.21.1795007462779; Wed, 18 Nov 2026
 05:11:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118103644.1360527-1-antonio.borneo@foss.st.com>
In-Reply-To: <20261118103644.1360527-1-antonio.borneo@foss.st.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 18 Nov 2026 14:10:49 +0100
X-Gmail-Original-Message-ID: <CAD++jLntCeQ3Vf_wyZ4XO29qK+af18O9vGKEZK5SeTAiYwq8AQ@mail.gmail.com>
X-Gm-Features: Aa3M54onU98M5wFucsM5k6yOBsRr8-I0B7BdMRpixqeyddiCAypU8y2RbjyUO8Q
Message-ID: <CAD++jLntCeQ3Vf_wyZ4XO29qK+af18O9vGKEZK5SeTAiYwq8AQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: multi_v7_defconfig: Enable ARM_SMC_WATCHDOG
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Russell King <linux@armlinux.org.uk>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, 
	"Kevin Hilman (TI)" <khilman@baylibre.com>, Eric Biggers <ebiggers@kernel.org>, 
	Parvathi Pudi <parvathi@couthit.com>, Andreas Kemnade <andreas@kemnade.info>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 11:36=E2=80=AFAM Antonio Borneo
<antonio.borneo@foss.st.com> wrote:

> On platforms STM32MP1xx the trusted firmware starts the watchdog
> IWDG1 as secure watchdog.
> On such platforms the kernel configured with multi_v7_defconfig
> needs ARM_SMC_WATCHDOG to ping the watchdog and prevent a reset
> during kernel boot.
>
> Enable the driver as module in multi_v7_defconfig.
>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>

Makes sense.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
