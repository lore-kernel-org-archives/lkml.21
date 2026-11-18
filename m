Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795035349;
	b=GO4c2LpERKdzrvaSGUdTyoTogVG6ZOOMvKNxXWQjhDzxOHRwyz5B3ltM5aeutxCue3tl
	 4BAgtHDxuSiBXPVXYH0bBYTCt7Q1LQHlb2JL0g9w7We/2OMRUqr4ej1oJe38Gv6eZTGmK
	 8tXz+DevpS3yHqvq/afb2xmiqxMz9hScJ4E17ZwuZ6LETpaLICkBlV/1qgb0m33k4xyEG
	 nlFgBOgrPiNzXRKj50br5jMr6k9ZNsw//X9A8HILZtU7o7tfF+dgzoYk830DpeD1ipS6d
	 XnCs++UUldICH8QTEmxFvx1NoqZjAE0vWdVuxikvwFs0nvD8I5nCBMrNjBXPmjn8ZIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795035349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9QJl621iF3UbAv+4qSrysOcC68FhiDlj4uSYelJCLVw=;
	b=WKjwn6F798Drf5EjM6sJkO2889NUjGY2Mh/DlthtBzE7BGWjkPc/cz81l18VQG6TkqpO
	 hN0XHS5eMKm/+zuBNrqOE2O+BYPe76sllIfCiuLCNVFHvQIGD2GNPCiv81oBi3+rBYUzN
	 azr0aqtt02xo63RHV3ulgbtxQ6flknL4OChx9j93uhDyZEPjEkspmQ/VYAPfW8huE9LCe
	 m8a/SgeiMlGzgLsXTOao1r/dASeaJ84aw6dzZpcv7t4EFoXoX98omU3fvEbsQH4ENZuet
	 MDyhKvdl5ERpAHZIAtgCCym4A33pTeEbfKpARq5ZkUvpl5Dk8jLQjOiiRtA+ENEME0g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pMvG3eK2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AF6606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:55:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20AF6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pMvG3eK2
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5366ae57896so13480921cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:55:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795035348; cv=none;
        d=google.com; s=arc-20260327;
        b=GtwKJvExk4xHhGN/ftlzLL+qpG2S4Vf/bZ54sywVZucD7y2kO9v/gTiVAoA7U/kPYW
         vyTApuvAjuer7r/fEWu2cTg59BQcfKBjn3ERvZ1FVP7G5W7fDZUrJz0oQMLnVUOKDyty
         2fhTDbAQKqW8Ccyl7OxdQYZEhdry69lBICfjVnmOX60XRW+Zbh9L+O73cgkfBqs9x3E6
         VD5rDXTw36fx07CRqa3fmk6nE6Bts3q3UZLqLH817kCWKJkArI6YyohdRfY8ngUUbto5
         jteUYNJDwH6MPDqql1tZ40KBEP374sj9AAEZKKw6bvXQPeygbjmvjO74Lj1hkR1RF/Ou
         uUUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9QJl621iF3UbAv+4qSrysOcC68FhiDlj4uSYelJCLVw=;
        fh=1usRH8oxMEIxWjnaz3zUJ1RlPnkpwlywfnyw5CH32m4=;
        b=RANKsZT5Vo5Pek7JD4BXTNKLvcTk1NUmM+S6kqu2EwUm7F4aebeWkMWSONMjx2NlT6
         EDDf6/PSC7jJwkfYC8QsubYiMLeA2RZS+u8tpXS7HwFYxgQwEv1y6InMyxE05dxufJAZ
         qvccjfbbwSMcpcxrGua+wgGPcOzEmpATwjmht0E5p6UtIrNhoDzXeb4o7HnwF/Fm1X/H
         kdBiv/9qtWWL9frryoGpc2ZR9emSGtjGbaGaVHF3zlVFTdJQm+qZsg1A+h1iMzWZacTg
         Ab42q4izWgzklrjHQUwDvQX9bWfUd19nH/v99P5jytqMOYGH24eE+p2kUdj+7gDxhU+s
         fDcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795035348; x=1795640148; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9QJl621iF3UbAv+4qSrysOcC68FhiDlj4uSYelJCLVw=;
        b=pMvG3eK2aogC2094P8BxtFGVGw293e8DdAnCtmwV4/ccDI7oFw8bf27i1rafYOyEyH
         UScSXoO37zMScoqsh8SFOSaoOg7T1R8UkmY4dEDC86Z9RHndvxy/MNb2aZjmHC2JgHVg
         DJ2r2u/dbJmzln7n/h0b1p8ybAPbVEuiFCZO7MCfjOszY7+LzzVpOdR0WQUtG9g7t89d
         JfFgn988ZtXxMY7AtF0SdLN5VmjKT5KEJX+qxBFUWSWmwZvebrWFMctLbr7K8E5iqWJM
         i9YkA3Ix1P7fExqfh3TpsLAQ0QGONZqKAWlyWx4X5spRwqwaFV1J8NG1x1voh2Qaj1dU
         /URQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795035348; x=1795640148;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9QJl621iF3UbAv+4qSrysOcC68FhiDlj4uSYelJCLVw=;
        b=CkZfg69rG22eD9jh05opRxPf46depd21VxrDKYdoiUJpPn6VYzd3IqQo/Re1zOuhEe
         GKRWmg9BrDUgo3FiTkHi4ESpjbKcXP94RncUjSlE3rOTjStd52uZAEAcJ0qTJKyga30C
         dv0w+drGEDq5Hb+akyRIJAY6vZBrSsT1rBajeXEF8smHl4PHE8strxxEvAP6ABdNvonZ
         kDnQ22Y9SAt597xaXv1og+V7fvFJd+Ma059Js/WRRT28XQjKJ2QdEZGMVQ1p+D48uayU
         w6H1ogZE/sKW86AyExJUi5iW+fhsJSbfYvQbVf6v6AwaSxuV9MB0cknAn1ZwXA2rcQKQ
         9DPw==
X-Forwarded-Encrypted: i=1; AL+hErGc68dxKn1o+rrGPDKcKLWjXmM5cDztZQNXCYmhBK8Vz6C7kuJitwniz9cMEd4z/fRmreg3lAvGFwbyIm8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3jxfG5R8Ak5lZlGd5i61pcOIRIMCQY42wYhMkNrmCLMgeGZyF
	9dM1fdCZhND1ohcxcNv6LqoJ0S+dBWKeOkq3UzP58rQmrIxT1889iLsn6+9hJEsgOmLa4jnuUDu
	iOM/XKgw3iYDprsuHekBtcjUyXVbMRF0=
X-Gm-Gg: AYBFou3EoaK1c5oJNZjiWFQbHu90iAX0Yfao1rRrzWXZ9/P35ANdh1+dZWH9fYZvXAn
	FWpF8OLYsI9iL0wlbj45+YXq8r9Dnm2j8QPqlwimmoDwSCPq6iBq+FwZX2EIt7EyPETKVm2nhH9
	XBlbV2UANO8fLDoJ8tSuvs2LZwF6DHci6D1GmODK8tNA5AmDGRfFdRTN7u66r1ZwzgLvsbr2UZP
	qT1CPCFkdh44OOT1EDtpQpFD0F8xpo9s8PX7wv7HBZ1V02tn8QMWY+71DO0FYFc/LcE069Dwejd
	CvNY0HNHb7Mq6CgUfELT3fslRrvBOfHNvYAesHNOxARsIx9O8y/jsCjWkO0+OeNIEborB0JD2Ds
	+B4C2ZAbVt9YtT7OQSGX7K84dlgFSAGzuKx41z65gCVk2WWdSb8Ay727FKHmmFTjGCFMXsPvOrP
	nGG/AjFCuPizpBpOGcsuhPqzmfw/IGV/BG9HXHhZ3HMcX0uwO4S4nNc60QjbrPCmJw2BD8QWSev
	M5Fb1p0x+9AbI+HOsxOoSoP
X-Received: by 2002:a05:622a:40b:b0:55d:37d8:5037 with SMTP id
 d75a77b69052e-55d5a75b268mr57892941cf.77.1795035347887; Wed, 18 Nov 2026
 12:55:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115140631.70601-1-ic.gabrielribeiro@gmail.com>
In-Reply-To: <20261115140631.70601-1-ic.gabrielribeiro@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Wed, 18 Nov 2026 17:55:37 -0300
X-Gm-Features: Aa3M54rVivx-ML4dxqs1VpuRKkdym9eRYRSCdvf3byQfdD2fvFb5_szmJ4VAN5U
Message-ID: <CAMAsx6ftHy7DPPcDXXCaOsEFA-xyGtgLD079PmzJst7c+-YvCg@mail.gmail.com>
Subject: Re: [PATCH v2] docs: translations: pt_BR: add researcher guidelines
To: Gabriel Ribeiro <ic.gabrielribeiro@gmail.com>
Cc: linux-doc@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em dom., 15 de nov. de 2026 =C3=A0s 11:07, Gabriel Ribeiro
<ic.gabrielribeiro@gmail.com> escreveu:
>
> Translate the kernel researcher guidelines into Brazilian Portuguese and
> link the page from the pt_BR process index.
>
> Signed-off-by: Gabriel Ribeiro <ic.gabrielribeiro@gmail.com>
> ---
> Changes in v2:
> - Preserve the existing toctree indentation when adding the new entry.
>
Hi Gabriel,

Thanks for the translation. I compared it with the original and I'm happy
with it as is.

I'm working on a separate series to keep only the plain filenames in the
pt_BR process index toctree. That doesn't need to block this patch, and we
can standardize it in your next contributions.

Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>
