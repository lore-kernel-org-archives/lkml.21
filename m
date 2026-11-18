Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795020606;
	b=co+bW7q4ApVUCMc1QRGwgv+UkYqYf1Ij94V6KkQTEbdgyWKyJUkh4lthBf+Rnj2JXQro
	 7nYSIRspF41JtXxLnxkB5IMAdPuJ3UZ8Fbig163st/HSkbl4hzMJSqt9pqadBv41YxyNP
	 NL+AG4t8l86G2W6Ay6lxuoZ4othFRT1UiXq9ycK9Q9JCaaUC0ZO79/DZMBVYTO7a65Z92
	 PHW19q7MDY7KZTCet99hptFtfWLrQbIbBjif7rOWHmquYYxI37kGs4zknD9vMKHKfwT9A
	 Asu0CwfVyYKvL1HOgq3CyRIxhna+Bs1yMXfaaMRhG/2eJjWUiF1OAuSgec0dDlbWcgQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020606;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BmkZHXBmjri2IPEtvf2Tq64RWcFCsPi4YttXc86znUY=;
	b=KwpXT0Sg3S/Pujrb804jTSQPKUC79FWbwRgLaqkws6It+0cb2Xj1N4r5ILWqvBYaMbzZ
	 mGu8LQh0y2/8q6LhxYdDLnFgIlWGQuhZCvNSdm0DyFJQcnq/j4aMdys41j5p/VOMCg5T8
	 wm314ac9llRlKZPRjPKtVGqSsdnRZnyAH9tjzqmcZ8g9FmKaMBi3UHRJYrQgYdqIfG/tP
	 V7JNMxldR+dZPeLpxfsDxzKl3Okj3PTag0eSma6/AqL1joxZBlKvsuiLZDy5hccsXpz8I
	 qXGZFmq88Ew7c6zTxPhh44j9My/PSAUF4+GkaGbZsE0gnCe5ONRGAdxiK8jXSbA+epg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LywfaUL1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.169
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD794606A333
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:50:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD794606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LywfaUL1
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5ee029fd76aso738116e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:50:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795020605; cv=none;
        d=google.com; s=arc-20260327;
        b=gtsgoArwYYEiMFsAvsa+fhOhiC09nHM4lB85dXMogE0qYCec5jvj0xpLhYDGQeGK1I
         d6YCx6DBcWHrnxfYqg02kAO2kW8rZ0g6Nc57i2MqYPt//STqq4MgLXXuwfBJHl1pZaHy
         T5UHdrKbk3oRNnEPBxBBN0rQVII9JSq5JT+MFwAhUXbv+gQA5nQh9FwCfb0keAsXkFwF
         1D3tzH6pAkU68IOB8gX7MCcyCZb5d8nX2u2x2KEMFEbHER/9g5q+5E0/yEOx0gsqvUQP
         JdAGEAGWs55OxC7bgHlSSGdfCwm0+8QmvUIbwNuAe7rom0FIlja0y+4C4VmdpnfIodbJ
         yTsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BmkZHXBmjri2IPEtvf2Tq64RWcFCsPi4YttXc86znUY=;
        fh=0ucPxRn6o0vq7mjAy5M42M3Xe4EETUyHsekW6Tx+yc8=;
        b=ZL75ILA/1weoLWZLfLgSYEJP8KBoAyEUpLORj9d+EaqcuXYbkWcrzW4OwhpG3PuMpN
         HLLeXT/KrzPvyNkEIfKLmOuM2xHIC6ZZECv97IKrvCOaB+7sfKPmjnJEyHXwZzlQJo/A
         TnkUQ0sGE+w0Dqzoe/vltwf0C305uCOPy27q8EHG60rk5JC1QfFmO6M/BdMb1+C7wY9l
         FMuAx0hkMXyC4JjLCcsxkdtivhyxeZaD76AOcyGrBNES2ekn0SWLtVRcFFzMrwwQJyKP
         pA9uykEKZCXLbOoLF8DIXoyCRifoUNQfP6/OyQT1Sf6r9A1DtraJxxg8VksV1DgYmrQY
         nQcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795020605; x=1795625405; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BmkZHXBmjri2IPEtvf2Tq64RWcFCsPi4YttXc86znUY=;
        b=LywfaUL1r486yC8yFxqpSnASvBblhpFGFn+QOLuObLNnRowhFh/6e1x+HHdNc5GoQz
         tlpkYJ/uBeokDk8ncy1ofx2qNEh/dgT4CHdrcvWrL37FSBtuwbIUa6NBtcThOz67RimA
         1RScJbic7yKshV5TrQIFE/MurTs/4Zk72VnP1jyv3eniFK+znBO/C6qykDlw6qKyKeKk
         aaaR1hIBBUddskXxVRe+TDMREw1ao2Xdes2rZJBay+EnB2VTIDKa3vNys+lS7pSbwJMQ
         KPaZnn+sDWDEAq8EPJtmf0GCXSyZGuSVfNZWz3dlzWIMpTMTn3VT32cD03h67EAbQ0kc
         n1nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795020605; x=1795625405;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BmkZHXBmjri2IPEtvf2Tq64RWcFCsPi4YttXc86znUY=;
        b=fdIxVZYZ+nltByNzqu2s9a2lgP+H7SMeoB4lgUBglXvKHt4J6ryede58ykllkDeiUc
         agP+lU3Fk34jHG01l4C24nlBCXMKDgV+NEtHk0iM0fqUEww/YeCygajI+gRKMt5rzkZH
         zh9SLHZDKu4KkKEsEGCxQ4gQ2+1Y0Xu+HWlJmr+1PpopcuA9Qvjus9VnrmdqjMiGJXHd
         bgX1AfDrS/g8UpbajwWL1XvpboiWkXkv2BzKu1nvwxYEZUGoSwkIpZCUiaPE4k0X+kDF
         t2Vv5BtqSsY0xFvpWeUHLJoDs/6eca7Hwm+9ZC4QiPMzC63rcqA3aOZBTnK56DfRx6Xo
         1BIA==
X-Forwarded-Encrypted: i=1; AL+hErEhDc2LDQx8LE+2QUS59LcfSf8J7zyB9qeLCRswP6y3e7PqiHjsoIxC4AwUolMOlHgeUUDyti1lfnGNzMk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MWwNv7a8RYJKEHU5YIWIdK6PHiCvMucTmI0BOd87FfKbSMVK/
	3GJRgYnj4kWZFFAW8NULFx8nsABOdadrlkZsmDGY45wlhdr9vDshdXst5R0lj9A+IdgOL+8RboE
	t6PJU5iLq/+QdVR2tuxRzPZZKXwxvsME=
X-Gm-Gg: AZFdTZdu+U0jCkORRgXCJ4ZoXT/JnJ2u5gnWCxm1ZPKJznGC978+9S+WVGNSPEUTxrT
	qqiRt46Q3fpmoK2MZpjnumR6KjNBP6ep7q+Fq2eYjU6RZXvDh8NL/XRz1wLW4669T1XEfGSMHJy
	jZ9ybm05Ca+saRPkT+n38BolkeQH1yul4Gedz9bL08IiFYgPlXpcctelgRka07sSu72GC6LpPoK
	RDyLWLcLiAxp2fYemGePBbpGR3Rsv1x+GfIgY7NoMsmk3hurtPuc0DHNGYKMtzse86Bmac6Kyjc
	DqK7TBjKNiJiFgCeRvh/ggRhmuR7WL0UxVVRz+Rz/RUhjUOCB2vuwwhyYPubd11On8yv3/lv5vH
	uvxCcg/L3+C4jJIrehFHlBHsWWK/u72DjESSIf9TMXL+gp8ovuydkT9YKalJlGsRKgEcpNkWq6I
	Qc19QmoDELXj/rMkoOniSC1KISQ/7gBBxbLoklKIDW7F1J9LiZbuezifINvVqLz/siBxeVeyn+i
	QBaexPD7OkOE8tj/codIPW91Df6cw==
X-Received: by 2002:a05:6122:8b1a:b0:5ee:40e0:482d with SMTP id
 71dfb90a1353d-5ee645eebbemr1908245e0c.3.1795020604679; Wed, 18 Nov 2026
 08:50:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-submit-rawnand-timing-recovery-v1-v1-1-1cc33723e052@gmail.com>
 <874idejux6.fsf@bootlin.com>
In-Reply-To: <874idejux6.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 18 Nov 2026 09:49:52 -0700
X-Gm-Features: Aa3M54oA-NhlWDrlV5o4l_cAgJ4pKdNdRQHVkaAuLvVQxEV9MUhD02iNL28zf5k
Message-ID: <CADvTj4or-XBJCp3oUh2T438Tf5kB0vfecNzOV+haisVrLKW9vA@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: propagate timing-mode recovery failures
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Boris Brezillon <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 3:28=E2=80=AFAM Miquel Raynal <miquel.raynal@bootli=
n.com> wrote:
>
> On 03/11/2026 at 23:13:18 -07, James Hilliard <james.hilliard1@gmail.com>=
 wrote:
>
> > When GET_FEATURES succeeds but the chip does not acknowledge the reques=
ted
> > timing mode, nand_setup_interface() falls back to mode 0. Both the
> > controller-interface reset and the NAND RESET command can fail, but the=
ir
> > return values are discarded. The function then returns the successful
> > GET_FEATURES status even though the fallback did not complete.
> >
> > Check the controller reset before issuing RESET and propagate either
> > recovery error when there was no earlier error. Preserve an earlier
> > GET_FEATURES failure and keep returning success when a timing mismatch
> > is recovered by a successful mode-0 fallback.
>
> You are carrying a return value in an error path of an error path. If
> the reset actually fails, the very next attempt will fail and probe will
> be aborted anyway. So while the fix is not inherently wrong, the title
> and commit log overstate the problem.
>
> My proposal:
>
> mtd: rawnand: propagate mode-0 fallback failures
>
> When a chip does not acknowledge the requested timing mode,
> nand_setup_interface() falls back to mode 0 by resetting the controller
> interface and issuing a NAND RESET. Either step can fail; returning
> success will likely lead to any later attempt at talking to the chip to
> fail.
>
> Make sure the error path propagates those failures in the mode-0
> fallback case.

There is also a caller outside probe: nand_do_write_oob() calls
nand_reset(), which calls nand_setup_interface(). If GET_FEATURES
reports a different timing mode and the fallback fails, nand_reset()
currently returns success and the OOB write continues past its reset
check. Propagating the fallback error lets the write stop there.

>
> Thanks,
> Miqu=C3=A8l
