Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795407424;
	b=hBJHuZ+ZzePCB7Tp2+YVtpisMB+asdHZ0FOguJ5E9q4NQ6zcykdwITg3LL6+dVXjB25e
	 w9jRNETKd/GCmOzEMovZLgqwUKedOe14n6VjTvYUQoGXLO5g/dLXlRJWSHCnr9leP5Szc
	 itZydizR3/v/1/UX7coS/mxNgw9YjgGjDxBUcAE+Ngpmu5NSdnUTlyX0Fw3kl6sPsTJfg
	 gCrtGYGapNhA8WUXP8Xd+lXeSoduSALCuSsCy0AmH1t6kk+Y1Ubs1TvtvaHlU0dMzeWQf
	 RZZsypIev0lcFwzcsuYBoJP7gNxzgOoRYg5oCnVZ6P8Ifv3G3t6yuJ3f3i7B2yt7ksQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795407424;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=YzRt0aFNigfIjuZzIG9Q1L3c5RdrENe2mSuQa2UuzMM=;
	b=XVIcc2fxA7KlJIrFeMhyBjc2alQ8kjxeGk6uamocPWHPBKPe6NAXQ9wAB0fhdbONpYTd
	 2iW3gosDUD1s4M/jYkl8vdPrIvhLQDf2NFcbVh25im+bPXv44Q0hJUXi1XD2ZA/noTWZK
	 UENAGeCREKaviPvsE/2DYGarEOwho4gvhLj+QznGCemJWVbTbr36o60rLx5V7YW9zHX9u
	 /Pg0QtDb3rodOUD3IjihPtIHmVsx9gffe1w0kVXXnoa4F5IGvq/I8bgEAyvJ6qgPPMmCQ
	 762rvqh0JUvbo+hn0eCLqU6nnhoVOkkKed+9ZxglQTAKMaxA+he0sMYkFCL/bQ5DQnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="pC2/5JIL";
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD90606A320
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:17:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AD90606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pC2/5JIL
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-38431138772so3660882eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795407422; x=1796012222; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YzRt0aFNigfIjuZzIG9Q1L3c5RdrENe2mSuQa2UuzMM=;
        b=pC2/5JILDWebNKIS7WN40P1R2+FeLvLjKLTsXNuBIfgFm0owzGiwJKpdD14U39sQOQ
         XuTPTSr0Ph0zRijincIqGnZi6Bjy6kn4hKD1fvqd5r0kS4vQcJbYyYbsnSrs5dvoDgGt
         iebo8pA1t8/TBtJtQivVLj/3OmYHOeLf2toFeUn2GC61WeAwnzt8wsES6gp+N0Npmyso
         7Jy03PsCWIYIdLO+XR8SNMB4KBos0yk+UCLcb/11dyssMoziSJE4uGm2ZwHu+PZ/F7a8
         2hHIvz92sdpvuvvFCBjBaxslbsZqE50x20YWSbIpGnYUv5dLq9xyOukpLFDW7Zu1q7l2
         aTxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795407422; x=1796012222;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YzRt0aFNigfIjuZzIG9Q1L3c5RdrENe2mSuQa2UuzMM=;
        b=mdOd0Kg1093LgVxFCyYNfX/iemK914WtRU+OEoydGPz39zUGZreDx84fcTDTvn0pxM
         JgPLXdkphURtLWGn8F++idEABptPh3QtDjVapvtncjn0wSVwIbaTIbCp3zC7yRYH0Hn2
         CYui5146sjCNmR10tJ3/MJzLlsCWVMklXihuF3a9vd4XNYyHOhCDZJICO00vRExh61r7
         sBbuoY4XlG5PEoQSAodJK+YdW2HnoXIyrVdlNCCvP1zTLON/pkdm6ulfoBjrf8Te7m4Z
         NHG2O9mBfWHzBd7cLTgVkvlrbe8EuvT0OklWxc+r827Ai1c1zwHlyPrHk2OMm78w2QFS
         foDQ==
X-Forwarded-Encrypted: i=1; AL+hErGc0GNarXhdibSBbe6VOHB19m9PVLLcRgTIRWFj3JuV/A/zdzqD5OxKEWaTYmGMhUicM/fF2WSFK7aiXY0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kLgGSjxxZnSBTmVAsWhjCI+C0+oEnKAKYIpQCIFsHnrzEa9Iv
	xZ5cS15zJeB2SrEmV+KkDIunnUppFavvbSs1lsmd/M4Uyp2/MnB6nSku
X-Gm-Gg: AZFdTZcYd5crnJUTQq17VTTQT+AVx7F90+FSbGcGUGy+KddZ2XQs63HCrKCEbO+J8Z8
	A0CUw9CegF+tFnkKinHijGeS+o/C1ca5TmwGogpvxIzfQxgscFMCnzdeOFX6NzHf2lpFqsEqMiE
	cBACWd/XNcqaJ1BAh1byFJxleRg/pvI3asIjnI/ZqM3m+85IynTCOT6T64zOqY29K6l9uOD8osF
	GtQxqouhAmzV7kVY44ZLeABryxYUcq50IC04um5pwPDGcbMKl0yP6JfO1wM0VpRYPw0ntXz25WZ
	fa2YggI3u388xNp/paMyb2Ivxwhn6JXPiSF/Agv4W+wKtnB38Tfvm0xYSVc/pUobpp+tutEvTnu
	qGqprUCpo4wD+l01zyC0CJdq1Q7XOSdkNJFMttSdKNqrg+cafQv99beM7tUiPLXD1ot9v5spyhK
	jIYudVi2ONGjaad6g80JNUnFiScOwzKgUbq2mbt2yi8P18NYhVBtu+5BtEnF3AFYSaIztOu85XA
	kEA8Eb0lMS6K8PenaLpq3qYII8j555EavZsTRUCBQfrVy9XmGCUzQNFaNTrfkkFIUdsMRD1Nw5X
	tuwrXFzklWvKd2MmzTNav+Dt1SD+kT7R8s7/n3MZZveCfLRaVy0vViQ1+2Nb7aROpEK9SQ==
X-Received: by 2002:a05:7301:1703:b0:386:319b:fb0f with SMTP id 5a478bee46e88-386319bfc98mr9614430eec.38.1795407422015;
        Sun, 22 Nov 2026 20:17:02 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:f002:4621:aeeb:e0e7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm36065292eec.10.2026.11.22.20.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 20:17:01 -0800 (PST)
Date: Sun, 22 Nov 2026 20:17:00 -0800
Message-ID: <847ed9034c9869373a150d43d352b2b9@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Michael Auer <mick@yoxcu.de>
Cc: linux-input@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: pm8941-pwrkey - report wakeup events
In-Reply-To: <20261121204112.847960-1-mick@yoxcu.de>
References: <20261121204112.847960-1-mick@yoxcu.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Michael,

On Sat, Nov 21, 2026 at 09:41:12PM +0100, Michael Auer wrote:
> The power key (and resin, with "wakeup-source") is a wakeup source, but
> the driver never reports a wakeup event. Its wakeup_count in
> /sys/class/wakeup stays 0 even after it woke the system, so user space
> cannot tell a key press from other wakeups. PowerDevil, for example,
> uses the wakeup counts to decide whether to turn the display on after
> resume.
>
> Report a wakeup event from the interrupt handler, as other power key
> drivers do.
>
> Signed-off-by: Michael Auer <mick@yoxcu.de>
...
> @@ -161,6 +161,9 @@ static irqreturn_t pm8941_pwrkey_irq(int irq, void *_data)
>  		}
>  	}
>  
> +	/* Let user space see that the key woke the system */
> +	pm_wakeup_event(pwrkey->dev, 0);
> +
>  	err = regmap_read(pwrkey->regmap, pwrkey->baseaddr + PON_RT_STS, &sts);
>  	if (err)
>  		return IRQ_HANDLED;

Could you please move pm_wakeup_event() below regmap_read() (after the
error check, or right before reporting the key event) so that we do not
report a wakeup event when reading the status register fails?

Thanks.

-- 
Dmitry
