Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795321282;
	b=3d6Oi+BhfqmQzuhiqD3y4AhARnaBuOxpKh/5a7k4R2iwVVq4OPr37/l7SeSz0GMrynLa
	 igPvMi9CJv/6z96J6BRHF9sgfcV3/cjLfvo8aTpgGfJ8zAghPe/QNMzWBSlqkd8xuIKbn
	 +hheYVRTNSvZuaRVvj1x1a2llZeqAs6jyk1a3w/Sn4t9xKI84lKF8OXHx0llm2CW0PLuM
	 q3uvcE5ShyIcnvw3b+wc17zBuPaP2hzZKevBuSDCtwa5MYv7vQfX2cWjawYiqPYOWJaw0
	 mepounXZfglXxLKIWF/dSnoSnrRlM1UEEg++1a7COxTj9jhF/weI1yw5mARRU1Q/rQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795321282;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5ZGfxFm22MqdeOsOLhYKxi18iGVL17970v+rtqXfBak=;
	b=bd0gq0KAvtpzUmuYo9jtMhU2r+oqUFoYn0Vgf+UBrPqKHp7V6lDIWZaVLvlaqCcVR5EY
	 WLLo0ucEJVUYd6jdkoNsAfTEFnnFspkpyeHv920EARtUtNRRmZTHV2SwMXRwqvLU7c75x
	 O8p1cfwYyVqU6RljNyEBsORiiy7eciyGbySAM4YV+FAQVFza3bDIjnFfRnL05LLT+xwnw
	 WulFREkNZAWjbEBrGcWGzDgcZGtHDTvkQVH53JTYu8dZw3hTzPhvbNalVZCAf/YODSJ5S
	 D9BTEvcUke9pUtsAtSpXVYevGJNkc58gaySqrnvNzoa+QUiMl6eRPwp9n6nkieAv11A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=TlXDXhE1;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A72606A330
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 04:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64A72606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=TlXDXhE1
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cde1479f76fso1396818a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 20:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795321280; x=1795926080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ZGfxFm22MqdeOsOLhYKxi18iGVL17970v+rtqXfBak=;
        b=TlXDXhE1vFamfVLeUXgS0rBDmWhARPSEQdZqgYb1TiKcGrKVl7fXBKPP6/JGfUDqYR
         OdJPTJdan2Hz8or3R3YtQFDsX8zxOZjjxoFH7usjuiOak/CkNBFXsz4OCOpUfpGXpdsQ
         TacQFdsnM9SmOIBkRkFLEBxIpkHt5UCcCb9w4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795321280; x=1795926080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5ZGfxFm22MqdeOsOLhYKxi18iGVL17970v+rtqXfBak=;
        b=zMKOvrOy954LWnKUa9crVedGweg8TnpbpmI9U6ZylHPJcaxW924BOlFZp7t2U0Vuq0
         XdiQ/FRoXoeu94UNjKV3vHBfsZVQVmkfOuInvLoNebt4XKribtYhGiR/nUbCFhQr7baZ
         uV7jIaB0vGfCL+PHyxVvYcakcWRf36n2aN7lMdmGgKjwg7/TKZeKjLGQSyUcYLIq/r4L
         KqdEz0cmv1iqMs18ZiVeNkpw+++exLYaOUNFcelv9tKk0BihwJhqvs0fZfXcms9kM1NM
         xejyHxdHN44hSzurz+mR4tbwT/3WSibYQYep/znJaBepjlRn8kKznrruTPFJ+vzSh1KO
         B9/Q==
X-Forwarded-Encrypted: i=1; AL+hErFI7rsXDUpk8yDEcWzMMpvl1AsP6S4NIeGZJ0aAlWvnSUJgsX6BDyIZ7OdKh6awY51R5Aslgc85b06lUuw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wVCATsqeIBulqsDrKQV/pBCrWNKOMPsD2HNLhq/b1JVWz0wlF
	3imtyvFcpgc2np34A9H7skFnktpl/jn+46/Hpn+ZaSKpzLuY14EyHEErM0n322ncYR0=
X-Gm-Gg: AZFdTZeIaeK0oE99LWlPkkeFhNfqhkhQz4DRei6eYGVIhaMhANnFlnWAwTEB5X4JCHM
	B7MvOUIJ6q1ouhlxGGQDHiylGamCTYNLH7WSecQBC+FjdfyIKEUkdpSXog7Nq3uL1oeUNoA30BF
	Q05qpygmmXP8u47i5jEuu7B3DdWU2EGPyX65sIxwZ39mGejPvOhjqeOtN4Y0vZKdtiH5qUKphZ7
	LgwCkGzR2I/saV1RWrZWc3v8znxDdmsnK6ICzKEXu2uq2WiLoN29mwryd8uADW+lqeCOoYO2600
	4FF7+i5EOUDw4WWlKY9qSYp1DVERjbx5n21wjOnKTxGz3NrCRwsa8dZxUKVnyauSunT4UmW0wAm
	nuen60A4aPOK0rEkMy9s87VXCUEpL9yOI8KqyRNUgjZ36Qi6/+6ltHm9riQc7KyQwmlWj+3brKL
	7vQW1xat7dzYRKBH7N2vGrtZUjO9AHDQaa/cCZhf7SOCYJzvy8RFqzDY8rU6pW8Hb/yD8K8PvbP
	oIs8obAanzKsiNj0pS+pqg/WtzEkFjWfA0hlW3RGlJHqwkJqN/GoOYvhqLnBXPqZ0rJAjgYAi9t
	LvpLdtMUZ/9rLNjbWthubnsR/YvMHpYHVkI/fxTdeSVYyZsoqKdM5C/QKzUt2l+mY1SJy8Vb508
	9jOhDcFR29BMa95UYUdqiP/qe7GoH+YqUvBuL2L36vIbO9wQUNFHRU4I0vILuz3QN
X-Received: by 2002:a17:90a:d2c7:b0:3b4:a90:7f3a with SMTP id 98e67ed59e1d1-3b41c95da5bmr6806828a91.55.1795321279640;
        Sat, 21 Nov 2026 20:21:19 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d97356sm13717803a91.13.2026.11.21.20.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 20:21:19 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: alibuda@linux.alibaba.com,
	Dust Li <dust.li@linux.alibaba.com>,
	Sidraya Jayagond <sidraya@linux.ibm.com>,
	Mahanta Jambigi <mjambigi@linux.ibm.com>,
	netdev@vger.kernel.org
Cc: Tony Lu <tonylu@linux.alibaba.com>,
	Wen Gu <guwen@linux.alibaba.com>,
	linux-rdma@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>
Subject: Re: [PATCH net] net/smc: validate the peer's CDC cursors against our own buffers
Date: Sun, 22 Nov 2026 09:51:13 +0530
Message-Id: <20261122042113.2430308-1-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <179528990895.3294.1614564040906254045@kernel.org>
References: <179528990895.3294.1614564040906254045@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

Sorry for the omission.

How it was found
================

By AI-driven fuzzing built on top of syzkaller.

Its analysis was checked by hand against the code before we wrote anything,
and every claim in the report was reproduced on net.git main at d5b89d55a322
under KASAN:

  - a 131072-byte read past a 65536-byte RMB in smc_rx_recvmsg(), reaching
    userspace through _copy_to_iter();
  - a 1-byte read at an attacker-chosen offset in
    smc_cdc_handle_urg_data_arrival(), from the CDC tasklet;
  - a NULL dereference and oops in smc_rx_splice(), where vmalloc_to_page()
    returns NULL past the end of the RMB and get_page() dereferences it.

Each was run on an unpatched and a patched kernel built from the same tree in
the same scripted run: unpatched reports on all three, patched clean on all
three, with SMC_DIAG confirming SMC-R came up (mode=0, fb_reason=0x0) in
every run so that a clean result cannot be a setup failure.

What changed in v2
==================

Sending v2 separately, because it is a code change rather than only the
information above: v1 validated the SMC-R path only, while the report
acknowledged that SMC-D shares all three consumers.  smcd_cdc_rx_tsklet()
reads the cursors straight out of the DMB the peer writes into, in host byte
order, with no validation of any kind - not even the length and seqno tests
the SMC-R handler applies - so v1 left the same exposure open there.  v2 adds
the equivalent check on that path.  The SMC-R check itself is unchanged.

We have no ISM device, so the SMC-D half is reasoned from the code and from
the shared consumers rather than reproduced; what we did verify at runtime is
that ordinary SMC-D traffic over the loopback-ISM device still works with the
check in place, so it does not reject a correct peer.

The interdiff from the posted v1:

  diff --git a/net/smc/smc_cdc.c b/net/smc/smc_cdc.c
  index 03ff10fef..8d24e0c83 100644
  --- a/net/smc/smc_cdc.c
  +++ b/net/smc/smc_cdc.c
  @@ -433,6 +433,18 @@ static void smc_cdc_msg_recv(struct smc_sock *smc, struct smc_cdc_msg *cdc)
   	sock_put(&smc->sk); /* no free sk in softirq-context */
   }
   
  +static bool smcd_cdc_cursors_invalid(struct smc_connection *conn,
  +				     struct smcd_cdc_msg *cdc)
  +{
  +	if (!conn->rmb_desc)
  +		return true;
  +	if (cdc->prod.count > (u32)conn->rmb_desc->len)
  +		return true;
  +	if (cdc->cons.count > (u32)conn->peer_rmbe_size)
  +		return true;
  +	return false;
  +}
  +
   /* Schedule a tasklet for this connection. Triggered from the ISM device IRQ
    * handler to indicate update in the DMBE.
    *
  @@ -452,6 +464,15 @@ static void smcd_cdc_rx_tsklet(struct tasklet_struct *t)
   	data_cdc = (struct smcd_cdc_msg *)conn->rmb_desc->cpu_addr;
   	smcd_curs_copy(&cdc.prod, &data_cdc->prod, conn);
   	smcd_curs_copy(&cdc.cons, &data_cdc->cons, conn);
  +	/* This CDC was written by the peer into the DMB we published to it, so
  +	 * both cursors are peer-supplied and index buffers described on this
  +	 * side.  Nothing else checks them, and smc_cdc_msg_recv_action() uses
  +	 * the producer cursor as a receive length and the consumer cursor to
  +	 * credit sndbuf_space - which under DMB-nocopy is the memory the peer
  +	 * itself owns.  Unlike the SMC-R path these values are host order.
  +	 */
  +	if (smcd_cdc_cursors_invalid(conn, &cdc))
  +		return;
   	smc = container_of(conn, struct smc_sock, conn);
   	smc_cdc_msg_recv(smc, (struct smc_cdc_msg *)&cdc);
   }

Thanks,
Piyus Kedia
