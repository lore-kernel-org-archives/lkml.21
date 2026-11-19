Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.194
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795089660;
	b=40UVUZmoAMTdVQDiqvWih8pjrghroNHhKFnSnp3gV9qw4Allf/efmuqtYYwUAWzrexUh
	 MpM3VQhd8UcF+/OhLKqGH96gLMiZlxdo2kjUVddaZ76ueNEOFuwu71420YQk4R1lJQE2S
	 zpeCZYaGXM7531RThhSh2pYd47d9Ok2fNRWcYwAn9eelBfB9uusYjCPO/Brj64e4cSXHD
	 auyg3FU/YO5MKkr6iU+Ta6Sz5bGfalLgznNcaHJC+NSR1uTZmyZ5vOqFqYAEfif4LQBHa
	 LFgo0ph4MsuAcqt27+S/YtlAjB7uTX+Ek8c3lnXM2OqxZ6Re4NLivqEH2qvMxtF1wDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795089660;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=PmHoASv/ZBuNPegMJO4sTM3s780shpGIpjr17DZNI+c=;
	b=q2S5tg8dfEBw0FMzu2h0bxS3qlT80rH0/Yvd6K35TUfyndX1iQImgYu4ZJPaxIqfGnm4
	 vV21R96C9crRt396Kw8F+M+ZOGdgeJqkZH6Q0lS1Zz+MRwD18reUGTI4ga3Q7IHpbLtSF
	 lJTep89yGYTrED3LaYW5ngxtkoP50lfFGsBclpoXjnuwh1vrIiMtrfngVVYWq0qKbEbtZ
	 OY++lndn/Y1G0l4aLsuuiLzzlQYRvf03KTkNA1iyRV9Ef1uiRW9Yhp7tZTM1NOYKmSrk0
	 EtAOYAebi628lVrnp5VjQJn8E1CiYIa6z4fN5+gkqKuzX8PlXpKMOCcOix+2REUG4Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MPcrZFuY;
	arc=none smtp.remote-ip=95.215.58.194
Received: from mta1.migadu.com (out-194.mta1.migadu.com [95.215.58.194])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD83606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:00:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFD83606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MPcrZFuY
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=LSXZMF3S7OYOJHwM1QSRH7X80XNBYndcmXoKDDjQXdg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795089656; v=1; x=1795694456;
 b=MPcrZFuYSWtbFX4xEnYYT/bfkpDNA3GKXLrFmoLqGLq44/NNp9RgngIH3t/PNfLIGILVGO6G
 n8lBxBOyQKWq3B0NKLk6yG967bisLJ3IORgPuSyEKqCO1btnsICKDqPR2kWjHyjhWbdw+u0XE+L
 zcGrnIyNNjejrBRtedJdE7ss=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 445f4c4c4b546ff1;
	Thu, 19 Nov 2026 12:00:56 +0000
X-Mizu-Trace-ID: 445f4c4c4b546ff1
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5be58ad9600so7826e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:00:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHw8nYeiWY5/6fVjL8JYDikNoH6ab/f1XG8kGfnWmP+a4dct5Te3vAY4O2zxDFGAyE5F/IGwrnRL7NL2rE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yAbm34kA92M4QPVBHqWF2kr7rTR0/lA70cKmULVhTpX2Ec4Fv
	n7kwJ7riEI3T3GnAfHT7cuwoYuZKRWCzvC1Hejp57ZdWLb+CUv7esMiwF3Mg5tEBAO4ejt6H584
	kcuf/7Dy1/CNc7bmyqlkpYua7VnVWRMPo+t48Ch7x
X-Received: by 2002:a05:6512:3c9a:b0:5c1:488e:a067 with SMTP id
 2adb3069b0e04-5c1b67e0252mr59074e87.16.1795089651342; Thu, 19 Nov 2026
 04:00:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-host_gicv5_fixes-v3-0-13c1859e8aa3@arm.com> <20261118-host_gicv5_fixes-v3-4-13c1859e8aa3@arm.com>
In-Reply-To: <20261118-host_gicv5_fixes-v3-4-13c1859e8aa3@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 19 Nov 2026 12:00:15 +0000
X-Gmail-Original-Message-ID: <CA+EHjTzPFjUOXCiccswH2xGvbiqgXPbSihov7MA0WuXn-SmrEg@mail.gmail.com>
X-Gm-Features: Aa3M54q0cGXEpu0u_MHtlVc61lpQYDybJxHzFMkhhDm4bjBsec_uETwUsiLZ0mQ
Message-ID: <CA+EHjTzPFjUOXCiccswH2xGvbiqgXPbSihov7MA0WuXn-SmrEg@mail.gmail.com>
Subject: Re: [PATCH v3 04/14] irqchip/gic-v5: Retain the L2 IST when mapping
 times out
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Timothy Hayes <timothy.hayes@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jonathan Cameron <jic23@kernel.org>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sascha,

On Wed, 18 Nov 2026 17:35:33 +0000, Sascha Bischoff
<sascha.bischoff@arm.com> wrote:
[...]
> diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
[...]
> @@ -217,6 +217,10 @@ int gicv5_irs_iste_alloc(const u32 lpi)
>          if (FIELD_GET(GICV5_ISTL1E_VALID, le64_to_cpu(l1ist[index])))
>                  return 0;
>
> +        /* A previous map timed out; do not overwrite its pending L1 entry. */
> +        if (READ_ONCE(l1ist[index]))
> +                return -EBUSY;

Sashiko's review [1] didn't go on the list, in case you missed it.
Sashiko found that l1ist[index] is read twice, and that on a
non-coherent IRS a map completing after the timeout leaves a stale
copy of the L1 entry in the cache for later allocations. Invalidating
the entry before it's first read would fix the latter. Invalidating it
on the timeout path wouldn't, since a later read can refill the line
before the map completes.

With those fixed:
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

[1] https://sashiko.dev/#/patchset/20261118-host_gicv5_fixes-v3-0-13c1859e8aa3%40arm.com
