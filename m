Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697303;
	b=5Cpgmu9qCc7eeS1QK+3VbR6jxv+Ihp+t+9bRrmYaiBWNU/proeuAJyFSzSYTVT9ce4xp
	 R5fyBwMeiXbLlAlnCsPLd9goamOYclSViwEj6Wott3dbPPbXXkN3nP4/hq31f3az3ME2k
	 kkF6lSHKaziHg6QT5rDnl4VztOdQ+impGSK+hQAvx3p6nP/Xl5QDKsSKfaZkyfdNxMj7Z
	 s6XesD0FWYJLe/YszJkmv7wkJSXxSGQGkc61f2qy0B+gyvve8MxjFh6bm6tcIicXdpwGk
	 Qxlp8V6NHPNhOHc/pwBqSjMPrUGrKL3zxT8qo2/dk7TTrpd98sD9RJ0qCoTj0cu1naw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697303;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=A58UABYtrnEty2sjHiU2WLl/hxy5u3d9ZmR6jr4hXxk=;
	b=Oa6EXd+9e+/vVL/+Z/JAIBtwZE/kUvLSQpBNwvmduGma0+eccUQcEkInqVV8dQgJEnKh
	 iMX90JMqncT3fo4yk8NahDzQk03g9qNXr8xgOuhrgo0YhDgLH5HX0sRm7tbzkZlriKAFV
	 ErvgsujUWs3iANBnW/jCIFtdAoQFYt/2r8d/E6uObB04vrDhDP2/ilcv4UyU0iWFj4e3i
	 xZFkLlBe3vfoLbHBZJxw7cBlEn7nHe46BSS9Kq176GI+60jJ5eZb9gwqanBOOjrgePuIP
	 cUNEv7aE82hIobCPjN0CpJx2WY7BZ+8yyP86JmDXTH0S2D361Br+GjEJ2sZgol8ETOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VIH3bDTn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4761C606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VIH3bDTn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C91581F000E1
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795697302;
	bh=A58UABYtrnEty2sjHiU2WLl/hxy5u3d9ZmR6jr4hXxk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VIH3bDTnvVGM6xc85XONsMwzIZSIMOX/kLGunOVHAV7NWrLxiz6tUtsxiX7X9eRBQ
	 7HlYscIyT0DeaCqLM7W3dKABi/wiP7ejbaUzNkS2UXlTv+0D98ZsI0bvxuTzEMXgg0
	 etY7ebPDRFamAe+bQS0Ir+tJryGJ/MEtY0kkO9pz8A428wghm0MzNRG3lApKhP788N
	 h0i7X9bZG9iNoltIBhFYeNUCD/W9FDi5oQq8Iqxry3Gg2wOn7vUXiR8oehSsQnAEfX
	 9KY2D8Wi/Y829/dJbIxfUh21+b9siRCy+yWkidhssnSqpASS+2m+QfBYAmHrvk17gf
	 qiAN3jfkksY6A==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3acc7a0b558so70178071fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:48:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEq+dL5USc4fmL2F2htNX66Q90yxOK6r4o5YQrfreFPBHLTE8MFk+DgtXiLUYdIh3MV5ei/RcNxvpkTxm4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VPol/d7Yokkh1I+OD8JJEfJNF9j7qCV6L/msZQDB5Posw1X/6
	C9hTDG6RNH9QV8mOITM1GZZe1j/8Dwvu6KS1snNXnLImoJt7V3mm26RoKvFkBrLDfOLE8TzLT9j
	zq8A+BRb89Pb+p9X0P0mkTogfDeEV03U=
X-Received: by 2002:a05:6512:a345:b0:5c3:35fd:125e with SMTP id
 2adb3069b0e04-5c335fd1700mr31267e87.65.1795697301561; Thu, 26 Nov 2026
 04:48:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795589383.git.hns@goldelico.com>
In-Reply-To: <cover.1795589383.git.hns@goldelico.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 13:48:09 +0100
X-Gmail-Original-Message-ID: <CAD++jLn7J7D-gobRYWWOk3Gk9-Ez8YEGT=R0SwYPgGRqWDKQtw@mail.gmail.com>
X-Gm-Features: Aa3M54reGVx3uHqx-zCudInMGYCYaxYXXbA1fSoBKZP47tBZ4PUO9v6291x42MI
Message-ID: <CAD++jLn7J7D-gobRYWWOk3Gk9-Ez8YEGT=R0SwYPgGRqWDKQtw@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] pinctrl: ingenic: Add X2600 support
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Cercueil <paul@crapouillou.net>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	letux-kernel@openphoenux.org
Content-Type: text/plain; charset="UTF-8"

Hi H. Nikolaus,

I first put the two fixes on an immutable branch and merged to both
fixes and devel (for-next), then applied the remaining patches on
top of the fixes in devel.

This should work out the conflicts I would otherwise face from
fixes vs next.

Yours,
Linus Walleij
