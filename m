Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018061;
	b=OjYGtrk+AJbrMqWOzUVyGbSvh1s0SK++M28u85H4uKQingHHUkXj8ISXv96pdoO8P027
	 lBHLfbAmckC052mpfFZPgcszOclZFJIMNT4Mo7DfdKl3wYagKiSFLLMMD+YpukH6h48kw
	 VB35bj7e7sl/aoWy9/Tq2WKozNDKLn0YzFGbuY97fQapbUyCQ1xC/E8EAgzhL+m3vCkZi
	 P8Lob4yf4KZeqWfPaw4VEJWCR/uA1BwbtgHz4fpUN4/m4mDsJQI11sI95pI8YDoYr7m/l
	 PFKwqE8jupDqWBwm/tqkV2RQhBtSdqQbbXscomVAx9wMVwLfPSN1UlkkCgK6JUHUr7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018061;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=ujkN+eC6Zu+/+obGmDVtyoxxt+WJSJZ0U/kWRfaBMgw=;
	b=npge34m2r2MiagqsDresEAv/XA+4swwJmKoBDnKBb6E8C1zYYrq6MeTFf4UFSUq1dMSP
	 EWcWMNDZu/qc2a53XNT+j3faoRnrzOMiFOCHEDx0VDCS+BeH4Eo9KnZIaXUk8oWOIGd9m
	 A5n+pxn4Pm4r0Nb3TOC9jPWCrBJ9lXapmaZ8+wXE1VASaOeSWP8fGtudEy+/XjiGAhjqu
	 RefG1gSV7wcaAm0yeI6NV6CeA4VNYGXEnJ+dSlydXVZMnHFpk1QT6kE/81X8TmZbHbRws
	 7XpiEJZ6Xg4P5i+e5xBqdk6znYvhqJ9c6IXt5W88vGoquBzbYDmtgAH7d17zJvsZbaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=WW6ACKA7;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B37760A260E
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:07:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B37760A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=WW6ACKA7
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-705cb6ceebaso1006457eaf.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1795018060; x=1795622860; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ujkN+eC6Zu+/+obGmDVtyoxxt+WJSJZ0U/kWRfaBMgw=;
        b=WW6ACKA7UVZiX0KfAzzg+edxiER4uOGUTJowPB7yetEcRNF0o4/Kgsp9BxcVCXTdif
         Tgv4mmpcq1Wmrf7KxcoFOWJZbPQfmjFqlCYt+veaAJCLfJJpjJJ0+pe+WJbg9pSpDyX4
         hEB4mBStC6AtALo5N6bjSJ5/23Si3ahmHjbu+4GyrjanqO9Z9FQL7hr4Y+i5Dj6ojLaN
         f8kgHBRGEQ82u2/SnxNtKDHtkRKPlhx5anbGuZ15xZocj+BHbgcKoOetIUpg1RZEvvJo
         MQ27KN1ViJofCC9c5ILfBA0ZvkCbNS1QGKsj6P7llq7rDd/KfASgsSuCATFnW+exUF01
         J99A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018060; x=1795622860;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ujkN+eC6Zu+/+obGmDVtyoxxt+WJSJZ0U/kWRfaBMgw=;
        b=q4yRAD8+y73wf+3zZf9sp3s3JUsrrD9Neq7+pltSmIQ6C+kAlCKqDO9RITjKxkWEFo
         Ri6PtXhE+tev6fKtGyCWdk7wupFrhVapyDGbg4nVGFXykibX2UF662AbP6O/T6RSLmuz
         XOpgqeWUkGgKfD/7iAHPeb+GR3rbr8OuDlHDWHKb8eQ7t+6LYUFvcMk05AYeKzJkOKwn
         sLNbA/zv0uN+7Kq1JAacqZ0uoYVAM7dInJK31hC19A6V0LxDKCM44yfbkeMWZyo8ASYc
         M1dYuqDr01oDn2sILER2QaR4VVVxqtyFMqOU0xe2r2sPA9/VBUxN4AUXQkvRN+RowQOG
         UgRQ==
X-Gm-Message-State: APuU4Z8Mp44GbsiJuBK91vMQLS0nc77DPCaK1WdTW+R4ke5iWsDc4BNg
	Hb6U1O+1BgsFOD4GErbTTcdpmcanadz6TGhXtnf6w8DNeoYp240kzVCC2jRXmsY1Isg=
X-Gm-Gg: AYBFou3LgYeFTLzPCnuGSTyhGFN9gLn+/hLN+Ba9SZw9DqEzmCQg2E3k06+db3xIVYk
	HT7c6jw2+pzz6L0syT1ftwDJyS0ShVF6ZaWDa73apM3YO44/SCbTfTZwufCBxh3Me9Gq4IFmAzB
	hnamQf0fJ7CpvHhEOs23NYe05uLfYObKeal04yZBv+cGOLis4HqMDq56r/k53GUk7bxgVk5g2Y8
	PZOZAI9IFps85cplSaGeFpvG/PXNb6Zp20zMhjzV0u0I/ZEddCXnxkIsEqDXTddo0nwBuM1Ozaa
	clZbmbSacEQC2MgtlrxLLSSmWBgxEzZiggRzYkZqM4ekMOWywIV15wz0+yAmH7eZ8sJNYXfVb1O
	Qzl4X5HliP5xyEw3k79VcxXIquBOljRY2FJlz/cfDOvc/23QNwJ83jEKAmIeH06G/yriB5B+76l
	46AgXPXqFuR04l2QjHOdaxDcbETluO/iuOUnD9/PP974wpW48FlHi14tsNGeMzw9AfcXqrHS2gW
	VwTcbZEw8LCr1ccnODiv6Qf/lQl9lIpdGvZpHHjiBpiXQ8G4tvUC92c9EDb61XeX1IrBktgrpBP
	yqVW9/FClWlRjeJTVIoUtFqNbShCNw88Oz0UA1URzDM6h951dOutfD0kbWE4hesr//DHROEnn75
	8ISDTIBQmLqcrid3fFLSLkwZeRzI+sInRAtmEgAfwvgOtEGM4QAJTRWkdJU2CL0ojGQA4KvOB
X-Received: by 2002:a05:6820:807:b0:71a:fa06:4dd7 with SMTP id 006d021491bc7-71b18454b50mr2463359eaf.28.1795018060423;
        Wed, 18 Nov 2026 08:07:40 -0800 (PST)
Received: from [192.168.11.112] ([96.43.243.130])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b743721fe9sm2624231fac.6.2026.11.18.08.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:07:39 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: tom.leiming@gmail.com, shuah@kernel.org, linux-block@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, shao.mingyin@zte.com.cn
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <202611112257529855AMDZLzg8ZmFDQ3fBstbi@zte.com.cn>
References: <202611112257529855AMDZLzg8ZmFDQ3fBstbi@zte.com.cn>
Subject: Re: [PATCH 0/4] ublk: report recovery test failures and fix the
 exposed defects
Message-Id: <179501805884.17649.3891543607346842206.b4-ty@b4>
Date: Wed, 18 Nov 2026 09:07:38 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Wed, 11 Nov 2026 22:57:52 +0800, shao.mingyin@zte.com.cn wrote:
> The four patches make the ublk recovery tests report failures from their
> workers, and then fix the two defects that the stricter tests exposed.
> They are one series because the later work came out of the earlier
> patches: patch 2 applies on top of patch 1, and patches 3 and 4 are the
> two independent fixes that patch 2's testing uncovered.
> 
> Patch 1 waits for the recorded recovery worker PIDs and reports their
> status from the parent, so a failed worker no longer ends in PASS.  It is
> a v2 of the patch posted separately on 11-09; the only change is the
> simplified wait loop Ming Lei asked for, and his Reviewed-by is kept.
> 
> [...]

Applied, thanks!

[1/4] selftests: ublk: propagate recovery worker failures
      commit: 6f3393515ee6526cf66175a85f3327899db765e3
[2/4] selftests: ublk: propagate stress worker failures
      commit: 01fe9c1894fc4cce7b04cdae5522c86519ba835e
[3/4] ublk: cancel commits arriving after the quiesce scan
      commit: b79225a8965f80b448dcdd236da2e1ca0690238e
[4/4] selftests: ublk: clear reused batch SQE command flags
      commit: 73f6a1d93040ac8cbdb03b3702a66e6a14773d02

Best regards,
-- 
Jens Axboe



