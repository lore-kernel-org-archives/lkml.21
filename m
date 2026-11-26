Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705594;
	b=sT5KDafWMc83x5+O40D5Pf2GVtxp3HFfUsu/yCctur+th/EBbyP0pttkZjjpGBNu9W6C
	 Bq++f/NRVslQAthNrOsQxHIFrwFx5aYtf8oLWiVNodDCcEzabi0lFQydTNcUCWTJwJKY9
	 Wzg6Rg6kTTYTPyH/jLBHFhwiZWyIVeCa4likgkXTUS7kbpLVNrDC3c49yPD0qKFTc2WVI
	 5eyvB1M2xrisPL3Ih+PbMGzUlAABelQwRT/DIYWUp0ql74ORJ+MewRf+/Z2YzSabl8xvX
	 c+S2lpyIu/4CuyJGT1jByk7zgWa3aXn5CkoZJ4zwIWhPNffpkaLK9Ky9TdRlmdZWO+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705594;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vFxzL6N7fV5dEdD6E6EPpo4S+xvEUTNbT1G/ro5XjSQ=;
	b=TCWhqnopDbjSCRx3KUQNCJibIaTtdnHIrZmMpWGumjFlsS2qJRUdz+ksoS1krbICUp00
	 rNskUYgOXhtUk5pmUHIvQUsNfEM4K/NzvXeO9875iC5ev+dEI/+oKISXYH7UXqrEgqPpN
	 fMXDO3MERkJrH2t5L4iJ5mpIzL+/4eEFYN0uiwgU6OR0SIOsOkgQp8zbEdRwjsrOg6l7+
	 IUQBOeE+SSDia4rAHw68T0n/LpGu7Zq2Er83Ur4901gdTsHvUPnssALtNmGRMBHhdFi1Z
	 UdNr+MuG8nJda3eWJrwKcSRP5pdXis9cdp7KXBj/B2I0aZLdrcOledNFx7o8YvcS4cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=cyj1fHpi;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C10B606A683
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C10B606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=cyj1fHpi
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc751eddf25so4567266a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795705593; x=1796310393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vFxzL6N7fV5dEdD6E6EPpo4S+xvEUTNbT1G/ro5XjSQ=;
        b=cyj1fHpignlDujJCnViGY8sX6x8wogPXBpBDbUr/XIdmWpWrKtxMFMMCszkNH5KK9U
         C41GxztehbjKMlbgmqYxIdLHn2VzjSTutkCUPcqXt+TEJt64BDjWklhaWCq3SZDfnOX6
         KmhhKc5hkKYtcCSsx4GDGusu3eAXwjUr5s5bc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795705593; x=1796310393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vFxzL6N7fV5dEdD6E6EPpo4S+xvEUTNbT1G/ro5XjSQ=;
        b=HziDM1zGrJVDBVrugTvhH9+XWREU2bbxlZU1IFuPGp/1KZzZym192A2LuEGf0u+HHG
         FVUj3embOWP8MrMabmp6XOvqWoObMw1Zp2lxrRxaTyvVZVc7fKrire3uCnI37AG5NNu9
         bP3YxTqoVW3cCK1l0fGYey58ZsjG15iIQg3BgxDF+9kSQB+Pj/0Fsnp5mjOn5CWU+W3n
         UKGu7+iFBDXZCHtvrTJzCCEJP5eOXhkCgthZHup6GnG7AIPZTfMi0cImTwEJIXcnbpM7
         oFh/9Pzg9f3dCnmIqxLN7oO5dyiBH4Mu1+m3HIYxRjI0Gq1ZLIKIYR6craihbJr/SwUG
         ZweQ==
X-Forwarded-Encrypted: i=1; AL+hErFtBNI+uGW9CvG8yzjMZRQuINfW8O5F2B4KLRw5llVRp1ARsHihNneYxOcYp33KhpswVdouYr9lALHjh8Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xpE+IJTigJJm3ZNXpPKiXTQfWU9GqwxTRQ5rlSWwA9UYhgsaG
	ONk5iOkEBl80Qe7GyAhUDsSKpNcu6apDR+8EjvlVtktI6LmALcj+rwXGRqItLKwWZBA=
X-Gm-Gg: AZFdTZcnUyEuWLkdOsXaqpBHpukmWuzpfxyV9JnUPFD0D9LOYFSVvqbHv2mOZDGahGm
	utWA1X5R65InSCZnc1qcSfaq9VuImc/joxvhwzx/g4kBACa0n1sms0zj9k/Z/cziPHubGd89tjQ
	sZwED9Zu1EzGo3fXjDCLWGQXIKMyJMZ6LtOrqH54I+N5uXMpm8kitwNcSd3t8SvdLe9FiXnU8uc
	BuSqD6mIvSTZEA2Q/7cnHZoG+MEXKDI5/nDHfuqDNYC1PYgsdA4YzfnQ0xSoObG6lebAEHAPxC7
	mrJwtSRhBp8sTEpMxFyuBmEUX3McooOqB+LeWDIGPU66mwkvQ67MloULKKGVdLA4FK/QuGTkyMD
	3Rkv3/nS8oJIdFLlt/dtJSEQ7bsbhuGaOxil4TtVnMc6X1gnZ+VT9JYXviuok5QP98uUccGKz+F
	0U1/FAV2tC34e6CbdZF5DZe+H8SgUPZHlnFI9HDmdoitD3v64CGaMZPyCSMRjiBnUKmn9q1TKux
	4rAQPhCvDELMVc0kn3S2tHP8bbZXvcgO+LgNIp4RrdxNKkwMUARA0eQZSYw1PqoUjQ1exj1hrhs
	6+rfyBtcWmZB29+PINIoDwCb4scVxttrIqiscZ4sIvY7ywMAmvxtV5xj22a4r4eK+tBkNkm/iq+
	s6VJIoJcPNrctXsZOYw48UGNigtMoKF1/D9tz43qr4xWBnzjNkF6ZscnHnBF5dkrndg==
X-Received: by 2002:a17:90b:48d0:b0:3b3:b5b8:1f43 with SMTP id 98e67ed59e1d1-3b41c97115amr22991604a91.62.1795705592804;
        Thu, 26 Nov 2026 07:06:32 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde84cd5ed8sm8039585a12.10.2026.11.26.07.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:06:32 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: wenjia@linux.ibm.com,
	jaka@linux.ibm.com,
	alibuda@linux.alibaba.com,
	tonylu@linux.alibaba.com,
	guwen@linux.alibaba.com
Cc: netdev@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	kapil@presceralabs.ai,
	stable@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH net v3] net/smc: bound the DMB-nocopy send-buffer credit by what was sent
Date: Thu, 26 Nov 2026 20:36:25 +0530
Message-Id: <20261126150625.2113302-1-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <sashiko-outbox-233892@kernel.org>
References: <sashiko-outbox-233892@kernel.org>
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

Thank you - the finding is right on both halves, and the remedy is the one
you name.  v4 is posted separately.

[Medium] torn cursor read and non-atomic update in
         smc_cdc_msg_recv_action()

Confirmed.  smc_curs_diff() reads wrap and count with plain loads:

	if (old->wrap != new->wrap)
		return max_t(int, 0, ((size - old->count) + new->count));

and this path runs in a tasklet under bh_lock_sock(), which does not
exclude smc_tx_rdma_writes() advancing conn->tx_curs_sent under
conn->send_lock.  So passing &conn->tx_curs_sent in place can pair a
pre-wrap wrap with a post-wrap count, exactly as your interleaving shows.
Both outcomes you describe follow: the difference collapses to zero and
the credit is lost after local_rx_ctrl.cons has already moved, or it
exceeds sndbuf_desc->len and the bound does nothing.

The second half is right as well.  smc_curs_add() is

	curs->count += value;
	if (curs->count >= size) {
		curs->wrap++;
		curs->count -= size;
	}

so in place it sets count and then wrap with plain stores and transiently
leaves count >= sndbuf_desc->len, where the code it replaced wrote the
cursor with a single atomic64 store through smc_curs_copy().

v4 does what you suggest, and what smc_tx_prepared_sends() already does
here: it snapshots both cursors with smc_curs_copy(), computes both
differences from the snapshots, advances the local copy of tx_curs_fin and
writes it back with smc_curs_copy().  The cursor update is one atomic
64-bit write again and neither read can tear.

One note for the record: the torn read is not only in the line v3 added.
The diff_tx computation read &conn->tx_curs_fin in place before this
series, and the snapshot closes that too.

What is bounded, and the bound itself, are unchanged from v3.

Tested on 7.3.1 with KASAN; net/smc/smc_cdc.o builds clean at W=1.

pw-bot: cr
