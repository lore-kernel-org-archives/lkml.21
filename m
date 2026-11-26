Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795728911;
	b=aLJhDL1RSbWWoJ9PaFFTTqKk4xZmFlPlD2xlPvnT4+49hMUueYLI5Chu/lHumju20UNx
	 8/I6A4IFe7DQPTvrZ5EuFLDWzIkpHnNkaAQt0orqOgEE0qxCBPCZ102TyCBxQR0ctDLgD
	 9qWDFmg7geaRYt8t7X6cqsWboCoQNYH4rS5ZLpu4vvqNC8rePlVzMG++gGiRZY/FmJmG8
	 oGuF5G3YC1vY+RCAv5iiGDvMMvFZOvt/qRit1fCzJN7plYaTwkasX/5PhKdjqeQQp/FVW
	 oX0bs6dv7vxvkfnxUIjYqh7dFC3HrIWB43Twcrfq+ja4NPK6uOxygHAh/EEYrznqzOw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795728911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=imr/pu1mUMJ71goiXUQ4VVEylGbSw20Gr7BPKxEeuK0=;
	b=ECdcGUlhEV2x7jabc99KL+PWTNvWfBYrnrd2SwHykhz71ZP6PYit4sftlA8BopHM9LdT
	 ZWLO8UHDDtX3kj6aesSL558ipbOdEah6vrAbWHL0+uJuIwh6SJ1bIqy65RwzLusy3GhgN
	 JpaiieZEp9Q70lTjqDulxerGZIXqedmJsv6qxKWMp9X8WkgRUsrtTv5GrzKpPw3beqkNs
	 2qjJjuFdVTuMGSTSp9Pi8glOdtQx3sObSS9FD6FAAoku0SHK2ntQL87Aes9xOVPiAAWuj
	 mnWPacysys1dTUe9bNd9EHiYo8xqvM7sbUJ9OL5Y6iUbaHrA0ICyv+28JtExJIWo1EA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=lixom.net;
	spf=none smtp.mailfrom=lixom.net;
	dkim=pass header.d=lixom-net.20260707.gappssmtp.com header.i=@lixom-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=K0hJivfE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FA2606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:35:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72FA2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=lixom.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lixom-net.20260707.gappssmtp.com header.i=@lixom-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=K0hJivfE
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93f3c616c84so576388185a.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:35:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795728909; cv=none;
        d=google.com; s=arc-20260327;
        b=oOruu469NhZ1jpwQ5EPH92bnx+Ben9s9uZp2qaDRtHeMl+dyM6krOBV2psC9j8hIvv
         9JEKhfxLZ2/Ty2EQHH/vCLxeaxn1yZSPKVrKywPGbw7jW46NICFUIttng+mk2LcHlWXH
         iWHa0byR4EICYEvE4tBduzE+pHsraV7RnFTOCJMzs2t3xPQO2GKaJvQIpZaVGNmgGj/z
         J4UKozkIpc/HyHjj7hSV9+f0PURkx7/iF0iRBriP/eMWR6rWqqLlYTDuRbS8Q4HUlrZu
         coGrUvzAPXVmsByd9Wxanl3pcQqDaDMhzIUGVS+PPUS8ATzaJ00e1ZebjI8Sj5b5VC/a
         Ez2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=imr/pu1mUMJ71goiXUQ4VVEylGbSw20Gr7BPKxEeuK0=;
        fh=lL3jGASE0AeJBRLK1ik/RAYU0xfhtlReXzbzXOBB8w4=;
        b=KcT2m11nRSb4giHfuVrsLAovXqbBt3AtFx4jjS7B3KUMCpuBy9HsrbE+X+bVG4UC4f
         gsKHlQcS8AIMCpo7TC7nZ9+D7fAnjpK0/H5BcLRfSx1UBB96ktmpOIX1jr8r1Oo2LhKO
         vz2ElHj3/8jsMhy0ktBawqUp8UVWB7sCJM2vKcbWxmu5xfPNP8MxejsQfbKA1rT1oWjN
         XZ+EHF/QeJJHuGuQAZ2uJyRnv08L6ucUKC336EeXltbSnM41mLnIEp3gxpZS5EL9NeVH
         0O1TBMUGcgmlo8Clv4+bMlAFtrjrE66j5HZi1G2YFI9tUagks7oyjJDW4WU5rFGj3Saf
         I+sQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20260707.gappssmtp.com; s=20260707; t=1795728909; x=1796333709; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=imr/pu1mUMJ71goiXUQ4VVEylGbSw20Gr7BPKxEeuK0=;
        b=K0hJivfEA1RuacjXScAzrXBUvwwwV2hlZ3LtF3+QOcsbVV0TYCDEBTx5+YXl4SzeZf
         M+HKA1u26UJC7vPk5f3L1B4ZgBM3ukugvzrPsuKJPCYd0lkEnjpsvneCFwPOB2CyxDNw
         XKx627S8+h54QfZ0exlpXj4aj8Q5Khan6SCLOHqzJTVIj0kaDXPw3ZkrzRDj1Rk7vXHw
         7jwnbEWiRgPBneQneTzLsLECKHbVBzClhVQI6re9BG7DgJPNTPn3ZzLbSGEaeAtV9LWE
         QRqrX7GZsQiIADpymyoDcaoGKUZJVBfzGH0okl0UD6KrevLAUUHFfq2KDqd1z/bG2X1E
         68lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795728909; x=1796333709;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=imr/pu1mUMJ71goiXUQ4VVEylGbSw20Gr7BPKxEeuK0=;
        b=q6JWHIkh/gh+Vf7zQenHBVfZdts2fhny6mlq1y8LyhMRNs6agSB3fX4p5HDKDRJghM
         M/O66bD7x1qo1R4rsnLbJBrM/+zFKJhwM3L7SyO3kFnIoqF5uh/NpYJMHfEUynwf2rdv
         9RBAIU+8U6VrA7Yn9R0h0SPyQvBbcP1WNoMVoJ6wC5GMRLrc72Qdn9LKeA9JJGBGXfS2
         PLMipcoogTqApvhnDKgYzTpvGLebfVQnx6radtSrDw3xsODq5y20Zfta5ZM70UZQoM35
         kmsnWVHpbZcRaSc5Oou5RibKLtcw3wmmMitcAemLN4KdcRNHCeIkyKHIxlwxbs8iWSW9
         hoWg==
X-Forwarded-Encrypted: i=1; AL+hErERIe/bE1KKGHYA/ghqyRiCoFFG+nWIVIze36FOt+sr83CXWSGPJ71lf33SHqABmHVJ+ZNdmHunCTBGWyI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+gwXvIWZvmeB2lrBMB3uLAAB8y0QgJKE1+wpPt9kp3/iwmeDT
	YLeEFCTdwCWQ//5XtE83kXbueQRQ2MHKJ5gJx5nPi4ZEPAys5gxSbwVumFCJ0lLDtqzDjgcpRK6
	WdaMKLV0bMXnBdJhqg/KrIb06y1sS9boF3FEY/824uFYhMH9CgPPi
X-Gm-Gg: AZFdTZcmyFvqlpJZBciR2+FuOT0yY//doNmIplJ6F4WxwLb/PZCPfA6l1HJuYn0p6zA
	HyVWkSBJ9Pud9ueUAHqv1FLS3oIddxpsJqc1iiWbB/eOR87AQLoEAf2UwD9kcVvpjTEZTEx7NS7
	4XZhMcCqH+DxIz/v+grVL3rgtFaVWjrAQzNhWrBOWD0Df/+9agLK8Tn1yDwXO5vbkH31FNO7+X7
	EzrinYWOEgeFKiNwzPVhIdRGpfP14jsUofJRjdVwW61RiVz+3kC+WiVUA4taeiOf7PI/WwY4mPh
	0W6ktiaKGOPUXBVjGUrIatXpCUtToTePdTtO09uT5BJTbLUos00CRZsYqkkEK7qLMXLxEKF9A6v
	7YSvI7mdRqR2weJaKfivlPiCHSmNVFclHTDxh+gEBURh1DY/+WiYGutvOYs1DeYj9roB0Z9I=
X-Received: by 2002:a05:620a:450e:b0:949:a13a:34eb with SMTP id
 af79cd13be357-949ba966a19mr4162430685a.29.1795728909325; Thu, 26 Nov 2026
 13:35:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261126081637.13160-2-fourier.thomas@gmail.com>
In-Reply-To: <20261126081637.13160-2-fourier.thomas@gmail.com>
From: Olof Johansson <olof@lixom.net>
Date: Thu, 26 Nov 2026 13:34:58 -0800
X-Gm-Features: Aa3M54o_c7qk5OPhsBIELSwKORdkmm8n7w3FX-EvieIWjU54dxA2oRgOKSssmhM
Message-ID: <CAOesGMge=cyKz-MLG3Ud_jcUBm-QiZk_VaMXe_Tn85pB0YuQ6g@mail.gmail.com>
Subject: Re: [PATCH] powerpc/pasemi: Fix pasemi_dma_free_buf()
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	Jeff Garzik <jeff@garzik.org>, 
	"open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)" <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 12:21=E2=80=AFAM Thomas Fourier
<fourier.thomas@gmail.com> wrote:
>
> dma_free_coherent() is called with the wrong arguments. The two last
> arguments must be the virtual address and the DMA address but the
> DMA address and the allocation flags are passed. If this function were
> called, it would call kfree() on a DMA address and dma_unmap() on the
> allocation flag.
>
> Add the buffer argument to pasemi_dma_free_buf() and pass the right
> arguments to dma_free_coherent().
>
> Fixes: 8ee9d8577935 ("pasemi: DMA engine management library")
> Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>

Just remove the dead code instead.


-Olof
