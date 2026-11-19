Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795093814;
	b=GLo77oOGF+Be5Vd8Gz8KwJ+pksJmms64UxIpqQ7WgyIsXod4fkh6TqEr3amxlKMJKJGQ
	 Daol3rxwk2oQ16I33QHPk4Hm2ooakH1L9HVeJruAbuFq0BB+LENBXRKYOz7CEigQxF9pD
	 G1tEZFawHahuSONUpyVxnx162KAq4tO75g3BO167w9Gzxm/GPGx8v/7MFYg55ZlI1hJKz
	 C3a0HYMQ9nBaOsJTuijTIMDKVO3Vg621vPdpyTjAlOW2t07XIMzmTcPmL2LKmMqTtveMP
	 a5REStkikArgDGBRCNeL524gfU47zE48hc+tYnOkcwiF3Ntxofugn3ZpsMHkAG4K7kw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795093814;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=0YkeRHLQXh9//5hIwvDEqz4eOkErWHqoPv1fUtpnY8M=;
	b=NacDkG2m30GNpcrcPDhe848JTk85mAdcBy8JFzCAyx7gE/yf/BH8wLawL919rD+YQV2Q
	 Hx9VLGYbWcb+5ZLPB+8jGQPzYN+/8N2tAd08KvOT5F46PxHsEL62AYoTI2tYP6E2KiWR7
	 9uPQJqPh2/F8gPfIEuKCPjtQKJ9dsyRfyNPZTR6iRZ3kY4Qer+AGKMWasvuuZxshYPnWn
	 5dhDTEd8iW2y8V+Z1IW71WjZetKLWZJtmDfbG0Xw3bua7zcA+69nq6FJf4D9yusNPZTLh
	 QXwoZjZu6mT5nKqksCsspaZyvo3jkUtpFE/bE5hMGNgDyrwJas/SY6zFI62sM3g0xSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q20Csucv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873F6606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:10:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 873F6606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q20Csucv
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so19533845e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:10:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795093813; cv=none;
        d=google.com; s=arc-20260327;
        b=neggQ+UNIV/wZyTjUMQf3aWsKythrVbZVCSEskZ9jfINhew2RIKNbkbs/egdPWO3Lk
         no+xINi4gtGsgEl094JsbMAWn1x5IePd2413UUTYsbMuY2c2yzeZSEOxTU7u86+NszPs
         Ur65ZREA8TWo+EzsxIqzFQzti7DzmlGF+lxjLl/A+VMMeDDOZnCfCMt9+Is+HHOwH6t8
         nllQYuReO52cDYS9c+v3fJFksidB6n0YjKvDejov1Mu8hjgj3BLJCAKdByNaK9mHJQYY
         7tvV0bXBr3W3V40hRDLDGYZIfJM2qelFqSf0bjxPWcI2lwJG+nbcXOCvQzmokAiYC0/t
         L+yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=0YkeRHLQXh9//5hIwvDEqz4eOkErWHqoPv1fUtpnY8M=;
        fh=jgTYLWO1xqevHY1V4kz8alq2ebTxd+Ra8sM3R+qKItk=;
        b=As/1CjnrOLYOuI8GFwMfG3pb6V1l6tY1JHcU3+LX7w0cbEr4AodS7dhEmQsf8wK87+
         hbZE5ziKKL7+Cep9GGmBFbC9BsL89eA58vOptodPgHEiKlPgNGVgHVI5lI3e3VzOMGXd
         f1VCXE10GvtC3Mr0fWFfkwWBgbsHyPEEy9lgwqKOza3tlmJtHVuf0TA7ajJMSZSP4czw
         XnWA52clwoK4TqhWJ2e6/fMqEA37DQGLxuxeW/0ETCsglvr2DQuuMA3vAPcHITCDchnC
         2VHGdRlcDQzHzHdCqe7bMQ6mZC/ZI5TTIbm16CffK9S/59SZDaNvK179iCrcdOKi9qVl
         G1Cg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795093813; x=1795698613; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0YkeRHLQXh9//5hIwvDEqz4eOkErWHqoPv1fUtpnY8M=;
        b=Q20Csucvuvx9Tb5WhFCQowHVJjc/rFkxPEA05yprnxRWUUR1KPaNZs5YMs29YW0DOF
         LsIatCWWT2JBkk8Ng4G3iz9/c/8vIvCNMQIAlfcZ83C6zWwvbrx1G7IIwKiNtGnjoDgk
         I8fGGqc/S/6iVNr1Sn0dXofgTIvjg8VrcUZWqBFWXRhComYSyEBCXDDh/G682UgcjLkN
         7IB+IdVN0WaP6qMuaiH3jdDLtqXpZDYy+4I4HlE5Rpi6F6SUVvGaE8LcZDZs2y+VrRi2
         ggGeEwbXadFlHX65rn3ugICox9rTs3Tl2iv18BG/wCViYV7Hq7D0uJs/yuZlm5w/7nfe
         7YnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795093813; x=1795698613;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0YkeRHLQXh9//5hIwvDEqz4eOkErWHqoPv1fUtpnY8M=;
        b=1BbR3/2AHV8oiQdpLa58g4MQMFL4uEh9d6rpcf/pR8J+rG5OVl3q5oLS/8GaWpVddQ
         /U00xW6k1DJCsJSeDhKf06xP/ikN0mMMmdhYr67fQ6b7YXgmyXmBIBRbSzF1y+25eUKT
         purQHN01N6CWf84A7YAv1QJz4ZIPtWYhmBg3toLFHIRghDqxs7P2QsWLdCSvyQmR2WK9
         w40THCx8YthyNayPr3tpdPi5uPozav3yxhbV/ZtIZFH5TDCsw5Ixlrg+AWyMAmuA7exB
         7NSdbuiQCtIvFpwp7XhW8aVcTiMCpzoQ/7zcnAP9C7T19P905emyah2vQeFZlfXmufut
         IMOA==
X-Forwarded-Encrypted: i=1; AL+hErGCu4OyKF23yXHE874d31fY5tR+sgr2HmW1c5DySwvn1oTHiOuybkiIeRxWvyhaI9KMB9TJIodrTvZXVr8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NUve0/6O32Oa0R+o0r3dAE65jHT7RVaZi3oRholvYKCWS/M9v
	Y66Mk0jrv/9BIvSJQi8ME/8C6vR8hmOHUCvzhEbHD1VjreJHi64pgFhWoBAnvYRKmosgkX8gyW9
	aCivmXc/irjrwN4xWIKv9yUr1oYZdS/o=
X-Gm-Gg: AYBFou1Q38ntABGIfMPsDHczy0reB8B6wEnvNKDwhNM+CBqADsfZXL5dZQ0esBLPuQ0
	t7Cm5Mgfx/q+OS3EpJ504o1GZz/k2zk8NVZXLpsVeORecO3krZxM85Oecup2Qc2lpE4mRnjluj9
	NLM9ttd2+vvtYwpJNkm2IU1kXh34j94FFyols870e2wvg2AMNM9Ca/Ckzoy+RSYer9gfBgaPmqN
	/87Ome2UENtAQrUkRnMvm7TQc2G/q8VtW/lXQBr3zIccsIsWHxW2QFuG5eZX8To9HitZReFxn1Z
	5P117AArXgbquy7rUx1TVStJtN3dMXxLseNywM2l7iZA77nYmaUSb3NlR+MGJJ0L5clxallvA4C
	AMA4/ULViRvKqkdB+evwotRUSFx45skpfWQ0kqyMPxj2a26HG8sGLUiI=
X-Received: by 2002:a05:600c:468b:b0:49f:e8bf:8f9b with SMTP id
 5b1f17b1804b1-4bb7d6cc2f4mr115781875e9.4.1795093812667; Thu, 19 Nov 2026
 05:10:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Wong Steve <shyckless@gmail.com>
Date: Thu, 19 Nov 2026 21:09:59 +0800
X-Gm-Features: Aa3M54rk_NLBNvdvWCWtABMbz3rNSD-UDzIhVnzuGyd1gYLXaiXITirQ4suK81k
Message-ID: <CA+X8SdjUoe-uhdG=+RbqLa7oaTwoq=2B5i5uqx8KtEf8hOdDUg@mail.gmail.com>
Subject: Re: [PATCH] EDAC/device: Fix double free on sysfs registration failure
To: bp@alien8.de
Cc: lgs201920130244@gmail.com, tony.luck@intel.com, wu000273@umn.edu, 
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Borislav,

On Wed, Aug 12, 2026 at 11:16:45PM -0700, Borislav Petkov wrote:
> This is where you lost me.

I ran into the same problem independently, so I tried to reproduce it.
It's easy to hit: calling edac_device_alloc_ctl_info() twice with the
same dev_name makes kobject_init_and_add() fail with -EEXIST in the
second call. I did that from a late_initcall on next-20261109 with
KASAN:

        a = edac_device_alloc_ctl_info(0, "duptest", 1, "blk", 1, 0, 0);
        b = edac_device_alloc_ctl_info(0, "duptest", 1, "blk", 1, 0, 1);

Without the patch, the second call gives:

  BUG: KASAN: slab-use-after-free in
edac_device_register_sysfs_main_kobj+0x14b/0x150
  Read of size 8 at addr ffff8880044eec10 by task swapper/0/1
  ...
  Freed by task 1:
   kfree+0x176/0x530
   kobject_put+0x101/0x1e0
   edac_device_register_sysfs_main_kobj+0xd2/0x150
   edac_device_alloc_ctl_info+0x3c2/0x570

and with kasan_multi_shot it goes on with three more use-after-free
reads and three double-frees in edac_device_alloc_ctl_info(), from
__edac_device_free_ctl_info() running on the dev_ctl that the kobject
release already freed.

The if (ci) check doesn't catch it because ci isn't NULL there: the
release callback kfree()s the object, but the caller still holds the
old pointer and frees through it again. I think it went unnoticed
because the path needs kobject_init_and_add() to fail, which doesn't
happen unless there is a duplicate name or an allocation failure.

With Guangshuo's patch applied (it still applies to next-20261109), the
same test only prints the expected -EEXIST message from kobject, the
second call returns NULL, and KASAN reports nothing.

The patch also turns the if (dev_root) block into an early return, which
I think is the cleanup you mentioned.

Tested-by: Suyuan Wang <stevewong@hust.edu.cn>
Reviewed-by: Suyuan Wang <stevewong@hust.edu.cn>

Thanks,
Suyuan
