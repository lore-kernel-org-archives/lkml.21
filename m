Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795219826;
	b=W55SI5XxKi2xyDGEdGt4wngiixt/SB8dl2HWhRKBova3NZgAY/1NF1VMT3Y0xYGuNnMw
	 ayjNY1Y8c/GXkKcYQv9xEkN8vrniE3i+ipbM0miegl7PW4NgJMNOoIHAqRf/pCbRdRVHk
	 f7HlyEBFRyEmmHkdZfS/SM9J6IlG9qrJ5+aIUSP8dSfdeykQEC+uitwEN8OQ6u1/YcZ76
	 O/Uaohiyp6fLyJHdL36/uWwj/Xr+WvkyOvd8GdvYQOwTRK1fexs/9UJlQPYsB5e8jeODE
	 CXmTd5TyLf7DzF5TpOEoo1npall2DPTjO7Fk0c+Szec0RTtxHFndNtVneNY9bmThX7w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795219826;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=btYTkEP0rN7aSSje7c80wAb1D+oRImiOAFk+E9S20/I=;
	b=uKWzTArafuT4Ps50mwhxdP9LrDIqWMwJFvnAVh/jMNEEp7TOGix292GpB6Sz9TktsHzj
	 G6R5WdwEKvPgCn5erVIiun+MgUt6g2MlDbXTB5PRAM1pxqFyb5prOi2LpZrL/vh7gr9zM
	 xf7+C+VnvKcq8tWxUHiTpMpOKwDoscwzDzfr3wfs92A7TRVbESdJzDsMI12O6+mytp1EK
	 okWcHBqeuOHve7robbkPAuEbs87uPeQOiJJUsKn1Dbra/A0RoYIVvplxiIf7PsS+opzzf
	 lhHbWtuStMPuBgIgtRq1QJpKmqtxDaEjXP4RtnVmdZn2qWpyXku/Kcq3HYlQWpoNPsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="rWu/61jM";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7297F606A332
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 00:10:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7297F606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rWu/61jM
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b8c60e0d39so1841910a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:10:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795219823; cv=none;
        d=google.com; s=arc-20260327;
        b=fL42M4kA927caAdSSSKTev0fonykn7D5vo3lhU0HbKd7DqwXTOHTi9znbpKxajcYHN
         xTUNYNOoTaRQSuhu1SYsq13u6mxmqrV5gYsYO9hN7KZXtuffnlm1p5xD+fflcy9p6pjo
         XhFxTMEdEuMgbSu+6dvwcIpWQvARbrb03EwXl1KQnuWFkSywGvRfWv98g+HlsvbBnyoQ
         rlYvzWJr2boLNd8Hf0/W1PuirUhLGcEtWq+iPVwVXHs3WtFVUL3/v39L49KMCGlv00SK
         fHBe09gh+W5Xw8+I1cPY6IkAt3qxuluX2vqHgqvTOktkoJtNsLkaXVJE3qGY+Jpf0TL+
         vp9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=btYTkEP0rN7aSSje7c80wAb1D+oRImiOAFk+E9S20/I=;
        fh=1KDb3k0slGxp4WOoEOFep14MpV/Oqg1IR8SLCAZ6VpQ=;
        b=QRjVeF8fPpHVArWk3i/r/nC3gNP+Sny2+UH0L43aDc22suP6ZKWRUHxYouwvarJg1C
         5fQW7MD7mUaTNx7XDTe9N+ZiltDFSlIZsWnwnV7oNqJZpi7mshjJqYtrP2xVu76+WqU7
         jTgObxk10byjs3BNEbyt2psUYnk89Ym8j4MEO8w5n/ENGTE+hLeCICKz+rruNbnItdr7
         lXbvSR7K0Thys2FwuUBlNMdEB4JngRMZMaFmV3mKKFbOoAQBwwz1AHFUS7sk0fScwerN
         YKhXc5fdej9JID4Cu12I86EYTs/28fbE/RGJgTK08rL9l1v6/IAoMUErCyAfPY7dUvMH
         pmLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795219823; x=1795824623; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=btYTkEP0rN7aSSje7c80wAb1D+oRImiOAFk+E9S20/I=;
        b=rWu/61jMhKyJ7vUuMCuiQUvlkSliD77v7oad+tKvc3mo0PxskhgU2oarlrhRONLIcH
         C7hwCw7DkhFUS1Fi0FSKfOqc73f7DCAqeIXJaYqeWe4ua/i4C86BeHZBDLke7PmVjd4a
         vhA7/NktPXU9YECCmOqJUT3pzs8+bsZIXhief7I3hTFaHixljFNONSDfB+TYvmYeXBwk
         3NKHs6jdXfoLnmSx8i0rdzxQZN6EdSt04rLza/oDALWmDwZYp/6bz7aSa0ClSmneFf3l
         2DPP3lW/sISNoTPUtLdMt68jJvaBvYReon4N/wsAN41olGMHIef7cE9/j1YrSHiQ/M5o
         n3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795219823; x=1795824623;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=btYTkEP0rN7aSSje7c80wAb1D+oRImiOAFk+E9S20/I=;
        b=1YYa6K1phdX8sbk7XyWHHcUXJxYwtLNwF5g+FzPn7fyXQ1lIexQjG6UB9jCvyvo/BR
         tJSlC1T3EiuwpaS5TtqWrG/0xpoDJbK6Mj/2NfODpppxFQWo3TY0bljqaaRyDC4OHp/U
         a947NBcBA1B5vWVSJe4F2YS9g6VeIXYWJKAG1pDOHz2AHTBz7RvcEdNoC8h8r+Hiss/3
         hGRZDqL6IKpkDWztP9aNawezwExwZomSVDtLccQ6tUUxfamTT5BZ5xOdPMYdnoDadmY/
         Crjn9E2PN/o2FI9DspeS4xCiPA4dF2jx/9BPZbplaq3zNvocOAIsU1bJTxgLDkd2mWpS
         WNJA==
X-Forwarded-Encrypted: i=1; AL+hErGdY9cBa3L8OvyUFEylP/tqQkFo+BCv+zEZM09NU8rnLFQ49clgHZQco0hddbRnlqwRYC6Sdc0UPDjdYe8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zdT1g+Nr4i+DJggjf8AUa3b+CRcTmUc/1WniW6oMUFfuLVZy8
	G0DG0lUKRIluSmGoqdqlV54VtxDMvw7wccQKYRwBHxgqQ69Coq8yhK6yfI/gN5jBkw9hBjx0y84
	JdkzbjF9+dc7UIp7fNRqF5e/h5r2R+f0=
X-Gm-Gg: AZFdTZdYg5RqEB/i9KMgN7IOJJqFej1Ntd6WhbXtPUTfxN9WXWRMYlcbCDG9nfIDuo+
	poJtbSYB8Ux5Bihlmg0TuVJT40yobnyhDsJ9SeTMY1lF37n8sGGTD18953aJD4h1Gw8TOT2qbtI
	JVjEg5a8isWaXn3bsE679iZhZRGiLU+5/5Xul9TVLn4Jw/c3p+/w1OsM2exYi2Nbn/IOwB5Knj9
	O6407wgCEBAMTIyFf7XfnOeqXDPlAuWPa5SZC/t5C7ixq1JsEw8HttFzN/qwfKYJeSPgmdf2cIm
	4mE2l7KGSLp32hZShWcXhHOvXhd7JxkyLSAIj7UPypvmTfPX84KzgeEcGLAivkJ83DLleIZlCo0
	ZfnwXvhbbeAOHbaWyHTWMXKQ/o9i8ua79Zq3ulUY6LEa+hoLy7TjshKB9zclH5UNfYVFew2Zycd
	xRupGavrj7hO6/GM/VVh3HBbH7MTtuIGFXFJgbEoAdZUEfNiS/bkHbn3T7svH9tdlhg5VNrwVgy
	yha6vmTbuS5zUtb6Ue3sTI1eluxRcY4wGscLgDWdmkFiQvW/dEPK/37zKd76HKmZW92b3A=
X-Received: by 2002:a05:6402:3514:b0:6ba:144f:ae3b with SMTP id
 4fb4d7f45d1cf-6ba37c76a3amr3704257a12.4.1795219822716; Fri, 20 Nov 2026
 16:10:22 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260921015952.1047410-1-rosenp@gmail.com> <2026112019-remote-retrieval-69b8@gregkh>
In-Reply-To: <2026112019-remote-retrieval-69b8@gregkh>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 20 Nov 2026 16:10:11 -0800
X-Gm-Features: Aa3M54p1_AfZUO6TiqmxTg4P4xauKpOoOjWuBAIoMhd1On__6G_1-ybx3Wy-ssU
Message-ID: <CAKxU2N_kX=HoQML1_udexrqM5h1o6-eegNhuZzMORZkSRVJ8CA@mail.gmail.com>
Subject: Re: [PATCH] usb: phy: tegra: embed UTMI pad config in phy struct
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 4:40=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sun, Sep 20, 2026 at 06:59:52PM -0700, Rosen Penev wrote:
> > The UTMI pad configuration was kept in a heap-allocated void * member o=
f
> > struct tegra_usb_phy, even though the driver is the only user of the
> > field.  Embed the struct directly in the phy state to drop the
> > allocation and the void pointer indirection.  The config is
> > zero-initialized when the phy struct is allocated, so no extra init
> > is needed.
>
> But why is this needed?  What does this "fix"?
It's only a cleanup. That section just clarifies that behavior is the same.
