Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795413151;
	b=f8OsIBTByQYDlHGkVweFuq1/t4TcrvVaoLdbpfJ6zqcMUns64+BslDejY2TGT8DcpdK/
	 rlaiYAWvNPxWpFQNgoIMTL5ZVRyGaIq6nu67WkMRXJ8RI2yzMCxDda+zfbyts7exq88wy
	 aJqT9G8OngC5bVv1SgVGs3k/y5Syp4maO3y0LopBUK34u2UMFy/PL5OJ5V2DjRkySPtQd
	 2+4IY5otYfG3CRLbB4+QNlmhzs9TD6KPiDvDZ7awDBt/OgVzCKCX7LuiTYaW2rQoNYZnN
	 ZS/i0VsHqPaIOei7XqXyFqfbwST0Ka+wZ9OFnbPwKsl63H2RcCxpiCPduj0w2aoAcxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795413151;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=SUu3oaJ8puWJKKOfHdRr4SqhOI+nPpr8oDOkprv0KLg=;
	b=qN4EsfjDaKFEN7ofmWBHu1+J+/OykgjAKC7mZfsU2yqD8fhFck14Irw/Czulr36JmpqE
	 iNtWXzNG4bK6he6Pr364LukJ5+oMCtsimU7ROnHV+uTsfpTakGg3KdP4zZAZT57fxpFJP
	 Nlz0FfmY7ANCC3y78sjkcQgJOV5t2igcG7wJzYp3jo5S+A3ij+lSt4VjV3ka8iTxR9qRC
	 UCKhE8W8M3s5SxhV/1gZo6KedmxDbMtp9Msa7qGuK9hP0aAPngZhqpLsritmcoyqs6swC
	 GeKry2rkDnY4x/McfXlADP87Odb4uGLL+BsfWCytwJsHeVEswSVvdxWfVHoMv1SwNsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=C7ofIZlg;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B36B606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:52:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B36B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=C7ofIZlg
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1a2af4c8d00so5153765c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 21:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795413150; x=1796017950; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SUu3oaJ8puWJKKOfHdRr4SqhOI+nPpr8oDOkprv0KLg=;
        b=C7ofIZlgBNILcEZpzytm5OfVAkteHyG3BUAnjDFQb98Kc3fmmIoSZLNwnkwPhPQosX
         Mg5RDym7AVeH9WCbrUhXkG2ZKsiUnXdTu/VzRgrO/5sOwmCrxBwtkr0Y6ezzShspRJPb
         +PDkCW1bKHuW7Xjr6vqEYYJVwD3iRtFtvcEmUj4HnoH/PtUMQcHz7m93QVCK0vRMoG1l
         UtM+9cnNd6HTPlDv9EnedN7l7fJc8j4NRoAWPS1k6gxcLyObFPD0SVv9GGNayE+zcRIG
         3hf9L/N6WT9KE8TomHCA9oUfdVRdCnQOjaCyZ50QQahJ0SPKGxbzp3KZvKpUIKAHWN+O
         EamQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795413150; x=1796017950;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SUu3oaJ8puWJKKOfHdRr4SqhOI+nPpr8oDOkprv0KLg=;
        b=xnezOf+opPp/7THnbfnYg0daN1uJNxiBQN6YvabSXKO4n0Usa/9Fv/xCZGZ8ubLJXy
         lelplTIlgGwF5zWBV68Vg+W6EM3n9evne2tvHWRHW/n462AOLXhpAR3t8TRYRDbzTLv/
         5yudHu4K+BF/JW/I+ANQGqnUeTQGssX0MGlvHcumgMYJwVnHSU0Pe/AqBR3D3YS7FkLm
         K3ku9vmHYuh9oYiGc0uVW08KBlfG6KFVkn/umddjaRSm1bEWgcD9UfEOGATR56evreA+
         lIIW+sjLINE7Iia+E/xZ1E4PFvvLWgJmhqE/lOWn5vPhb9mLxd8zXejiZc6QueQJVsj0
         7eDA==
X-Forwarded-Encrypted: i=1; AL+hErFaq/UaHRgPxjUxRD8pLnmFH+XHrWDwi6rcNqzPG2zSSZuqePfNwTDAmclb2BGV81fhOl26yV0ZqALXS5w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZHlknjoARM5bl7OK/j3qhJmVhV7B25Ax6bKHQMDal9UugG6ll
	xJRinU1RUgtiQmNu3V79ateHrFs2+6y4JxHdrNyTucnDM1JqULMO/4tL/6gxrttqn8g=
X-Gm-Gg: AZFdTZdH1b5dMRIp1nANg3zBJ0+FWymv31ccDeFUhnmDDI622IXzWLbrg+3MY0uxaAp
	73t5Sk3y1xHTWos2x6dyZvRicRRxNW2rjmAlZX52MBLzcaQrjlcRJkyuaT66I39L2giRzNzddPc
	DbCapEMhP7DfwV/cHaowoFWX7wbnR4c+2RFYVGwTJlReNY/W8uCoFy4QoygStyfXAxWF7yVF3zc
	wmZh29vOX711bGTlBjtsjPQtpU0G2ZCnAvwenVkJcWCYl32Tg2BwM1fNNFV4gYpbVpeasoInbWd
	NU7/04IUd18+G6Odg+v2DwDOPaTzMGQZpIHNlhVXMp46ZjiZXcXiEhW2CrKDCvJy1kIWLDWh4Lq
	oeo713vUHZqYoZL5RFcu0wiuz2v/O0o+xA2Pieomo81O5EuYWbaPdWw4mkV/RwqRtWfRelzVlKf
	GLc1uUIkSy7kdkNgr3TfBK9TzmpokexQP5HxY+HNUVfZt5EcSriMtEPKbePTG3YNc1wc5eIZvAb
	+jFfFrbpBiEqvz6kaI6rmJ2r0dzOFSN3+KaFNAPS5XHRxzFn7So3kA4cuFY+oZdQLD/MiiVJlFT
	7iGnGss857efYxLfbqp0SCxR5y0Cgg==
X-Received: by 2002:a05:701b:4555:20b0:190:8f72:445e with SMTP id a92af1059eb24-1b556877915mr12166436c88.11.1795413149986;
        Sun, 22 Nov 2026 21:52:29 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5569bffd2sm23669790c88.0.2026.11.22.21.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:52:29 -0800 (PST)
Date: Mon, 23 Nov 2026 11:22:26 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: shyckless@gmail.com
Cc: krzk@kernel.org, peter.griffin@linaro.org, rafael@kernel.org,
	linux-kernel@vger.kernel.org, zhongqiu.han@oss.qualcomm.com,
	alim.akhtar@samsung.com, linux-pm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/3] cpufreq: Fix leaks on probe error paths in three
 drivers
Message-ID: <awPUmsmWWBKdVUyQ@vireshk-B250M-D3H>
References: <20261123-cpufreq-leaks-v3-0-1f1e3f4f5a7b@gmail.com>
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
Content-Disposition: inline
In-Reply-To: <20261123-cpufreq-leaks-v3-0-1f1e3f4f5a7b@gmail.com>

On 23-11-26, 05:40, Suyuan Wang via B4 Relay wrote:
> Three small fixes for resources that are not released when a cpufreq
> driver fails to probe: the cpu clock in highbank, the three clocks in
> kirkwood (also on unbind), and the regulators and register mappings in
> s5pv210, and its reboot notifier, when cpufreq_register_driver() fails.
> 
> Found with a static analysis tool and checked by hand. Compile tested
> on arm (W=1, multi_v5 for kirkwood); I don't have the hardware.
> 
> Changes in v3:
> - Add Zhongqiu's Reviewed-by from v1 to 1/3 and 2/3 (Viresh).
>   No other change.
> 
> Changes in v2:
> - 3/3: fix the Fixes tags. The regulator and reboot notifier leaks come
>   from e8b4c1986efb and fe7f1bcbff91, and e0e5b2b4f427 did not add a
>   leak (Zhongqiu Han). No code change.
> - 1/3, 2/3: unchanged.
> 
> v2: https://lore.kernel.org/all/20261123-cpufreq-leaks-v2-0-29277f2f0ddd@gmail.com/
> v1: https://lore.kernel.org/all/20261122-cpufreq-leaks-v1-0-96fc17ff7339@gmail.com/
> ---
> Suyuan Wang (3):
>       cpufreq: highbank: Put cpu clock if clk notifier registration fails
>       cpufreq: kirkwood: Put clocks on error and in remove
>       cpufreq: s5pv210: Fix resource leaks on probe error paths
> 
>  drivers/cpufreq/highbank-cpufreq.c |  1 +
>  drivers/cpufreq/kirkwood-cpufreq.c | 15 ++++++++++++---
>  drivers/cpufreq/s5pv210-cpufreq.c  | 12 +++++++++---
>  3 files changed, 22 insertions(+), 6 deletions(-)

Applied. Thanks.
-- 
viresh
