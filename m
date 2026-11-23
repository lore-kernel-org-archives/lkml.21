Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795476530;
	b=NUGq6XLVh1AoVXN4NGypqIbg6Vhj/IrukBTcFwknLo9OgUk8D/Qcvq31NAGkRUnlJXKe
	 k12h+SAg1X05naO4MU0YWKFd/sDhPMMlH7Nmamllipg9PQafoQH6krACUadROxMK7+iCs
	 QGvsLTkbsDE/KX0qRGpkuMrqr0Om6nZKfjAQHvxvwB3NfGlweqs33OLRO1U/qXoRwntDg
	 G9jIfcArsyKW8FPxiTD+ZIpBOSI57ZhVDztrkXDZLA4Y6VRIImkIhPFfoHn/XuoniWuNd
	 PNw7Z7hosqsCeVb+M4JeFgS78SH9KHEI+9vFvDWJuq/aYDraS+rtnLc//Z0XzJ71Fow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795476530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FwJrm1ZM1aehEhc2izkgjrLKRPEQAGiya3xImxW3kxg=;
	b=yb0hEX/A4W8IooWYSOE5QnuACYYh7/dtnkDQTM3pyXS78nyfMrzplsV24fHYgzIfVzWu
	 TMy89rxtIbinPhYPXMQ1hpmt8wS2y80COfG0RhH/1t/nFhYDZnQzmU2g1AbWBhwU3TjW2
	 p9pmQ+ZwiIiil+kFVpZxqXxyE7KhCxSYs2g+X0tS2B0NpzagolQcI7jFbIMv2WpBFuKP2
	 QlML0hDVvjCRAEDetfTJxYi6sli4DvlNLmx+Tmi45jAp3lCONQdtc6IofskZFbk9eXV1A
	 yAOyGiw+XXZ8QTXSuAN533zcEP0tFA5IY5XEK4zEAIWJYkacs2EneZ09qnVD315KF/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=nAJlelzV;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7C4606A331
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:28:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C7C4606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=nAJlelzV
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6ba1e22ff4dso4457345a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795476528; x=1796081328; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FwJrm1ZM1aehEhc2izkgjrLKRPEQAGiya3xImxW3kxg=;
        b=nAJlelzV0W3bFHx1nGZMeGZf3y/OlXVcMa/J8vDvS2w6VWGcot66X8UINPIPB8tBuQ
         GmQjfzIWAwjz8+VDCIPqbsgcos9UcuSo7As81vg5OTC2Xxbhemto71gX3I13isNm6KVw
         ueG/2Geai9otTFoOviDwOK+kaj6BliZMYsp7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795476528; x=1796081328;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FwJrm1ZM1aehEhc2izkgjrLKRPEQAGiya3xImxW3kxg=;
        b=CnfI2B48CElOlf+tMqJnAK32xpgEUKKEuADL0R56Iu1VggebSx7NLnJAN+I9Ch4gyM
         9EsOa+lNW7R70fBPFfFft/myFhUyWPTqUlneTJxlrPn74zvMO8s1SaF38FZFqfrYNeYZ
         /Pg9QnXgK+wNx81rHJz62wBczz9drl5P+RnPzaGSi2OONotuXwqg34zsxh3cJKRmW2V1
         aTrrPUtPSwgfxYrdTXJ3rDap2OFdFb43R6qnbnMQ85dIuKSQQNGEcjEXp2k30j8yGTek
         T5ZS7945OVqkPOpMltkLEHHEcnKzwKKgewfRn4toigWpLKA85k67MlDAnMbJDguYbXmK
         0cOQ==
X-Forwarded-Encrypted: i=1; AL+hErGJpby1xwG8Cxfnp8sai4ciDN33XiyK0jQvfktijV/JToo4KOPg5Z2+wJXRjKkAlH1ws/MTUrXPGqbd6m0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+q10BHoNY6YqCX5ufV999I/e3SjJKC6nZ9TAk6K0C6VIAxecGy
	fjsM18MvbAiEUu7Ht6vzALUB+B0YpSEPIVzpR3+esXnNwQW2vWIxSer+a0JMllAaaTDMIWAAQCm
	OlT9+k5wS
X-Gm-Gg: AZFdTZd6OP7ydbVB5z2ABIcLPSnBdNRo3M0R8N+ybvEs+8ImQzaoguEt1WRbzdX/Ws/
	dMz8dvfGqSMIWxajI4LB7OBeVlvYRXdwuzpDUmLLBloiui07hQNIbNtHfQr72qqgGSXn3WvCGwF
	qn3X5SY1S8D84TMJeXmsfyhKrTzuRl33gFeplbEVIGS2OtkQYpNScl0aD6/TFEJ5Px+WKguCOQo
	vDlRQ2tX5TtdzrN6ujys23TfekShJaHjsirTYGT0t8T6bNcSDh+Jp3c/ITPZEhc3p1aBdawVuxU
	LWqWJrXs4DPz8MSFwuz1sxN+Zsono8eP6vD3gDMTiFzG7IH8hDTyx3jmO/9lcfFR3tGW0aTBU0p
	SktqT61GTS0vI7ULpsGu5HhZsTGBmZjxMdOSUM0QkWEeIPLONgCuSvWoOG1Cl1E/MSGrogsXNHP
	vTKupWlj9Z9C2PdbeeOxmcFIlu9FYj4HTaOnQjzl9eg9gKYlMJ3CLA2ceefIHQlZWebFY0z+b5T
	UdOrHmeP+wTWXx9lGn37xwPYaHydxa6UViZ7sUCKg+qv72WVazRHowvn9OdXpiJ7dxbDnG+hy6J
	2WZ773R8yzq/UaVsq0lmOUWQZ5lTtG6BmAza07LoyNKgfVYxSyJ6cePpyK/B3VvTVgzP
X-Received: by 2002:a05:6402:51d2:b0:6ba:4a8b:96ca with SMTP id 4fb4d7f45d1cf-6ba4a8b9b95mr7187071a12.8.1795476528127;
        Mon, 23 Nov 2026 15:28:48 -0800 (PST)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba3710721bsm6204411a12.29.2026.11.23.15.28.45
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 15:28:45 -0800 (PST)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so3210812f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:28:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEGB+MCpkgkXFRNPoCRLuv6JIz/oqxm5jiS6pyJUvQK8KDws+6+3L+/cMDLZOvtcbZ0YukJWOlxNoY3aMM=@vger.kernel.org
X-Received: by 2002:a05:6000:26ca:b0:4a7:8406:1e6f with SMTP id
 ffacd0b85a97d-4abb0c5d691mr23431674f8f.17.1795476524227; Mon, 23 Nov 2026
 15:28:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112031629.396819-1-mrungta@google.com> <20261112031629.396819-4-mrungta@google.com>
In-Reply-To: <20261112031629.396819-4-mrungta@google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 23 Nov 2026 15:28:32 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WosKh8Rxh1J1cJDaWOEfS-pYneBmjd8FzOV3oyv0HgdQ@mail.gmail.com>
X-Gm-Features: Aa3M54rF-cDwPhWxLgyNjBG3mfbaET9nDbSRqTDaBh2OJu2DLtMaENnnVT7qQnE
Message-ID: <CAD=FV=WosKh8Rxh1J1cJDaWOEfS-pYneBmjd8FzOV3oyv0HgdQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] genirq: Implement synchronous disable_nmi()
To: Mayank Rungta <mrungta@google.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Marc Zyngier <maz@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	"Kirill A . Shutemov" <kas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Nov 11, 2026 at 7:16=E2=80=AFPM Mayank Rungta <mrungta@google.com> =
wrote:
>
> Currently, disable_nmi_nosync() is the only interface to disable an NMI
> line. Drivers stopping their devices need a synchronous variant that
> guarantees any running instance of the NMI handler has completed on other
> CPUs before returning.
>
> Implement disable_nmi() by validating the descriptor, disabling the line
> via __disable_irq_nosync(), and synchronizing in-flight NMI handlers via
> __synchronize_nmi().
>
> Signed-off-by: Mayank Rungta <mrungta@google.com>
> ---
>  include/linux/interrupt.h |  1 +
>  kernel/irq/manage.c       | 24 ++++++++++++++++++++++++
>  2 files changed, 25 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
