Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.219.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795680622;
	b=DJ7AayKD7vP+i27ZVwEAOTtoq4mdiASS3/T7Zbv/cwBZo4bX3OXgIv+K1BmVaXXufAXO
	 3+rM1bYkfp4KEWTO289KEzo4bAxJNPxFml+6CNbDfUHPJpZoA9tK9Q7G9gPMoegQFbG1I
	 bRd6PnjDXxxafEVlptXFeKgVVCZ/IzhXangyvrVX5nryuGEQweybplAIdKHrboNtwWoyQ
	 HkUThmMbCZp5NkH+EU63FsN717rv4cYMlt+N0VOGTaYs/d9BG+W+nh9ImupebYDE6SJLC
	 oHs5R+UOTED0z58q/eXysFvmoe+tu0Bjqh2Qm1/bYDTZ9Sqdsktp4E19MjCVsnCQcCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795680622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Wy8dia1SpW3v1KBZQHRSI//A9PqnMJx202VcrBv4o7Q=;
	b=ZOIVTtPL9jBKVIGrBjtqze2jLTQxe2YZM+x3uAYAabacPuKnyXfzGcsx/apUkZ2E1c9W
	 ZnNvJhAnGfNbIrjIElcSRDWxSsgjilnGstKj0CCuf0KudbFFPK+HGyCrG0Zz650MIzM/M
	 6UqYXZdkONu3ai6CZ2PDzUANukYuCkbW9Wrd3l/oBerhT+7HqLJK3xf0iAI3ocuRLiVx8
	 MSZVVaVrVc5HSuMIgD9GNkyTQmGn9Cebf3zI7aSzpFz1SpcxDkOihbeDjnH+9jIFcw+9t
	 fJZ+3YRgp9hATS5+buWZWJBCWluKbuJQRiJiD0ysoQQDhd4HdByIW8eatuGUzNmNa3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=LEHU+lgO;
	arc=fail smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2DD606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:10:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E2DD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=LEHU+lgO
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-92107df3f13so63662966d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:10:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795680621; cv=none;
        d=google.com; s=arc-20260327;
        b=NXN0QCzeyybh9x6r4I9BJMC+rgpkzKVWK2q2IBUZV7/HuXppTcZYU4kpHflBoYNV+R
         yanVXy6nFFTiOrJZu/0meC0SnGX60HogrxWInbtWFdAg1/GFWCgpjLNtIj22AJkyAEgT
         /skaFxgRnbVtb68s8PnyN/dqEmJ9QITo+g+zGohydZIVUZ67QGaE2zupzMlKFUwLwT3U
         XpHaUUX/DPY15gzAeMs+4e07JsmRellcD8QfV/81YUaKhWDGbyjvlX0qXNgYr/ZYbRQA
         1/s5wcho1pp6sJyxohk3I/PNXBAZDuUPCoatNxQd8NI006afKcXynF3sFW+HptKo0RxT
         eTMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Wy8dia1SpW3v1KBZQHRSI//A9PqnMJx202VcrBv4o7Q=;
        fh=r4Kwr6BPdOb5gOEY3GFzUW6qV9NH4mTxF4xjj0msFiA=;
        b=hXSj+1SIkS0VRBJVssP5gvpSWIdQAsV7achaMfqH7SgC99/USzyNSshs4ibiwQfP1L
         PeZgdicpCquvR0OsIFxn2Q1uNJ47FklluCUmWYvs7bJCYO6hI8Nf+ynAvoMHFeJpDTCK
         aczqGdLEMiQwq0Lccy9iVIU3cfFp8YCHRM4FnwBeivyS+CgHjLfNSm5wo8Pbi2amHl8R
         2vfF5UXxjYIvU4sEc8GxlMl+qRMdur1pCvy7arlQMWMskKvK/g99TqgDK18IwGeVMMOV
         LL+rvyYRxQUJB1P/qweg31zIfPzOn+sC7Bz2Wo75CcVxgbSLcJ17vnfED2wEs9JxlOF1
         8nsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1795680621; x=1796285421; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wy8dia1SpW3v1KBZQHRSI//A9PqnMJx202VcrBv4o7Q=;
        b=LEHU+lgO4bXG08o3gs2s7YFtXC4JmBEcQ3R6HnAGjp86uwk9Z1EPWcqKtDV3894H33
         cm/164ghVg0HbKsCnzRG36MoOXuMHPbiF/XHblFzBoNGoTSAVq9NKNh/5fTZ368zUViq
         wZl1i/TFFX/sC4tMVQeyGGNLelJ6F9M1jmHO24/Nr6jmKdHN49xs7i9SEzqbw/aZ6lD7
         yikiLTr4K1EZTqohzKLYWgbD5REA7fPDIwrJfNfMT5jBqAseqnogM+0NvOUdYqjOrG6R
         SD8YjsleaWPk1V9AkIcSAbhXIQskNqKpHQwGUAZtJ5ZcqGfOuFFlUI5QjI8MrxwFg8i0
         JdXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795680621; x=1796285421;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wy8dia1SpW3v1KBZQHRSI//A9PqnMJx202VcrBv4o7Q=;
        b=aEDdwTFbXnJiM81hxyfTTfjjiAJab5sYqbGXhVqbwOUok4NVY8nRcgP+0QkxUkRpbh
         qtwgrF26R9waVqe5EGjvv7ccss21rqo2QC8jWb08oVid7dS08REDiAHoQQfzezSuVj/3
         01jwyqJGxrD9siYmpZAuN7shsOkAAcDA2MvNZEKUtXCrnzvdrKSc4a+ArtZj9JYIP7TJ
         HcQ45OQs9O0PbCPVCt9AxRjyEe6gpf6S0kjPszKUumDlxhCV1+5VN+zGlAa6ZrKj79tH
         Vp75XN2HZeybxb1bSUCw8tZxrcZfJbXaU2Iqrb8ExhkBAZn2cq09/4JxRymZiqEjBDi9
         2ttA==
X-Forwarded-Encrypted: i=1; AL+hErFZQiaRTQ4OqREqYfw5t+CyzPb5RKsG1KrkUhBOYXZh6EBoSOul1+KZGCbr8cQg0lv9UcHulVNcJobdG0I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EveeihEzpG9yBRQyPAFv9qrWUn4+hUnrp5z9kiy0i26ijFPxS
	zhd6bMrTbVCrV9LabewKJayiVkf8fZgv1mtpnwip/Z+6nqetgdoEXqV/lhRrdyzsPfJOfcFtzt7
	wPkNGydDMkOlcT0RxPTAljEq+uxVk+YV43jArsyQx
X-Gm-Gg: AZFdTZemkCILtZ4mQU9Tnrq/1LdDb1or3gWGDBsE4ulPoflTdoyzQmC0FI6AlTu1BN4
	J8VNEmm0y6Qd0Pxy+IhhR08L3j1cbJ/Sp8QTkbnYgbMgXlBG4t0CbAa96El1GCWi+n8ggIHpfyf
	fXQSGCQ7d+vIiWJl9V/1SyX7gCuLXdYBDDep+vzFwT5zV4sZPYLP+i6oshkLkizhICIjW7rK0X7
	e18vjeiY/1vEi1xAF/xezbaG6JbBHw7f0BmYbjVEykOF4+PcmwLSjS4t8Ec2V150DLSnDxcAU3z
	K1XpSVxCE9f5eaAkflv+7Y/7omxs7SmtZruPZr7nbWFyFA1hNWRyfXAOyRyXBaumUh86dH1NQmr
	/sYrVYVTQUeoTZ0X1DudbCG5TBiVdQDslp50swV2Jwt87BPBcD3llO+64V8b2M9pH1Con9LJDG7
	GIUxNTsogv51Y9Of6GpRZb7MpGeAxuOlmIj+s=
X-Received: by 2002:a05:6214:8441:b0:921:1e0e:4f97 with SMTP id
 6a1803df08f44-92134b03b01mr303378966d6.30.1795680620848; Thu, 26 Nov 2026
 00:10:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-de25-nano-v1-0-473d16131f7a@gmail.com>
 <20261118-de25-nano-v1-3-473d16131f7a@gmail.com> <20261126005120.176307-1-jjc@jclark.com>
In-Reply-To: <20261126005120.176307-1-jjc@jclark.com>
From: James Clark <jjc@jclark.com>
Date: Thu, 26 Nov 2026 15:10:11 +0700
X-Gm-Features: Aa3M54qYE5oVeJKlBQz_MKlaOtdOgsDzCf85Y1jzqfbjt2TEAwsajAiaS_0IAJA
Message-ID: <CANz3_EaWr=qjxrVL6ZoqbxfzUxBJ2cH1s-x2UQanpj9AUwtkkw@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: socfpga: agilex5: add support for Terasic DE25-Nano
To: alex.cramt@gmail.com
Cc: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Mahesh Rao <mahesh.rao@altera.com>, 
	Mohamad Asyraaf Azhar <mohamad.asyraaf.azhar@altera.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 7:51=E2=80=AFAM James Clark <jjc@jclark.com> wrote:
>
> Hi Alexandra,
>
> Thanks for posting this. I have a DE25-Nano here and have been running
> a mainline kernel on it with a board file based on Altera's.
>
> On Wed, Nov 18, 2026 at 08:07:15PM +0100, Alexandra =C3=98stermark wrote:
> > +     leds {
> > +             compatible =3D "gpio-leds";
> > +
> > +             led-0 {
> > +                     label =3D "hps_led0";
> > +                     gpios =3D <&portb 17 GPIO_ACTIVE_LOW>;
>
> My testing found GPIO_ACTIVE_LOW is wrong here. Altera's and Terasic's
> device trees have the same mistake. You can test with
> /sys/class/leds/hps_led0/brightness . With GPIO_ACTIVE_LOW, 0 turns the
> LED on and 1 turns it off. With GPIO_ACTIVE_HIGH, 1 turns it on and 0
> turns it off, as expected.
>
> > +&gpio1 {
> > +     status =3D "okay";
> > +};
>
> I suggest also enabling i2c1, as Altera's file does:
>
>   &i2c1 {
>         status =3D "okay";
>   };

 I also suggest adding a &qspi node with the flash, which allows Linux
  to access the flash as /dev/mtd0. This should be disabled initially,
  so that it works with the Terasic flash image, and then U-Boot can
  enable it when the flash has been handed over to the HPS. I used what
  was in Altera's board file, but with the rsu-handle removed.

James
