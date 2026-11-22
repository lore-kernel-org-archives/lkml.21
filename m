Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795343925;
	b=5ABTlYKX5aq2cp5IFQMyNgcqm3rJVMJYQe4OtnBwFyaOrj/7M86TO2ARiV9mjSkPc+Dz
	 WDVSgYgvui9c74rhlQQDa5ojQUbZ2NUKaPpn4grLKXvy9oUDvjdm9mGzKHgSskvSjsFS7
	 E00xmzp7Of7DhS7Wez2DKX4SKWcKVVRa6pudFOgLEuMvwqL4eRxf4DoOT45sFTmzRWWtK
	 au4DIuTkLnNwlEuNtUw8Kh3LwhMq1OrRLtA0dr4gbbzFKIFIXy96o4YOpIDs/FnT1KhUJ
	 3lr4xfKHCO41TvagzB5ZA18TwX8HqHezgCxOVkkDL8JXGsEvSzlEcVMyv4nNb9UFDMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795343925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=iIoyRD5bmDZ1wW5ozSGgF56j3yPp2m5ZjkRy/haCeLs=;
	b=THqc1nWx4fOxgmdhDjFGRo75nlrgECb5vWyHR4Dgcy9K0MJUvYC+WbbT2xqS7pUK+xba
	 rQk7ItEtjU9HA7EtQilK3NOuJ+ZgUEFydB5b+eLLAL2d9NZK7UrN3h9ccoibrsPNkNnXs
	 tx3Zmw/1zY6NEFoTXrCJH+X4p0Od2yV/+sBqr5YKTiXvxUsFZ0hrKwdG3x/zU1IhgC4PJ
	 OsUWKVdqFr+BN1kWjrVAqFLVeEkKU/oBS2JdV5ZQ2ufZkLxuBtmtYWMI+MzFXS9cFBnIK
	 L2O640GMSLCTSX0Gi1+aRj/CNu0xPerKK+6U3VDKrLFqP2cJl8qijYqH2p04Q0sKuJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mlEMdPuy;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817B9606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:38:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 817B9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mlEMdPuy
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-382f4710a17so4035807eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 02:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795343925; x=1795948725; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iIoyRD5bmDZ1wW5ozSGgF56j3yPp2m5ZjkRy/haCeLs=;
        b=mlEMdPuyJmZNrl7OSX3glBID/2JV716INprVp91bSSqm2x5VmWML7/dsRJ/QbF02lA
         ulLDJcTeEkUXlz7oLEy2bkQnykFJPvCBWLL0X/Ft11tiWZTYR6rnxXOGQRcKREa2q9QH
         L1C4Ijj5VPU3rbBSBwgVJDBkyUqCL6EwThiK+aV4d88I0PUVf2BQW2133f5KoRlJGgfY
         bwYrYoHVv/Jw7454rrkmiiHtmb2kD99rRXhrfn5N63MgdpFhjWJjxFqiQVRb9braGh6Q
         f+ysKZJy0FNUTTeyAPGIA8/h0DyG6iC7783MkwK4WdajSUBLTHXbmj4KvkYFYlc3qXxQ
         69Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795343925; x=1795948725;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iIoyRD5bmDZ1wW5ozSGgF56j3yPp2m5ZjkRy/haCeLs=;
        b=f7Q41TmFRAtPxC5LXiFweW9YFHK2YVD/aOrJuzT5k6RgFCltTdQsgwirIVbADPBD6y
         ZNV6wnhO13LPEIJMGmGfm5UGBzlxZIz0U2ewMvFdVDM4lXhYgb4QyX95ZWrvv8o7kwjO
         yR0wzL9pC3E2/+uMhafsJ10DJPOJoRPvqrlxKISi5VfWkJpEX7EsusrXYgS/lDDdasAM
         efudXlsa/6OrtNDLy2tJyNr5pKFDes8MsfnqfOC4aRZHqI3rZKVVD8w7J1iX7BhlkdPk
         mjf/lEritNTJEFSDIzLBGxexj7y/QYCqwU7dzlGrmTBWwV5A6ArOtdCn2mkexWMvSSq0
         Qw5w==
X-Forwarded-Encrypted: i=1; AL+hErGBCjOD9bHfiZhP4qsoy9oJ8W5hztCtZww/r6MSgzqE7DGJtrKrEimeep9g9UvWJDr149Q5A+Tk1LPkn5Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xhg5hqCe5eKrK6eD1bcRd+RovpNUeDih9ol70f+bwNPFeg7ez
	bGGhF4VvafVwHNOz70D3+1dmtW1QDH854Q4shoUG7D6E4fTPw6asSha8
X-Gm-Gg: AZFdTZdhk8WzOB2CIbLMWI9om/nvY61I6tBrzhLx/4tR6em7JQghCZFvw5Nz0ej3BNq
	iUMjsslsOvKbm4+SX2C50p2+H3ZSUqa3i6mZr6wH26OLs3Akab4laTbCqf6elEXdkaZ+LmXQDQg
	jIsdghSLFsMK90lvkcKWgxhc0EI2HDlJo02KvPfFFV80rN5vddrFI51ZeofvKOoo7zBNEYC9cuc
	MCjv9WmXW0qK7EsvIFs9LMi7VfbPjI7jKNYtzUdOFxETCmNzGlNSA2zoZWglXFHIsXpJqtbWMZO
	BtPCkC5s1I53II7uraXn7qD8NemCyITo0Ng5wqA55BtxkcKk0mDQBH6tPkNdiFAciOEEMLVjFi2
	usZy3pXbp/jv/+OHN+QhtzcXnaFYITJi/5//TA3L1D9cWpTFogo15uOcz6Capinadsm1KUjz/D6
	c+27nZx8dCok/AOmNv23Pse4yrstDcglrWrbFYPly7xkAX8BXTkf3mzL5PLKoUAE+q96HMbhxKo
	gzUuy1wzd3t5irCN15LDg2VHLfzTcV40QcM7MzkmvR0BlG9XANZSnMV190j7/oPfjiPJVNm2Qoj
	pCvw4iVMS5xeCvpHRpHK9pIPWKpya2+BMIVQ7nyNR1FDFZAtzyDDGFiUtyaybOqOQVs=
X-Received: by 2002:a05:7301:6497:b0:386:a671:899c with SMTP id 5a478bee46e88-386a6718b9emr2334718eec.34.1795343924573;
        Sun, 22 Nov 2026 02:38:44 -0800 (PST)
Received: from boogieman ([182.66.218.119])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385d2b93dd9sm27124771eec.24.2026.11.22.02.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 02:38:44 -0800 (PST)
From: Abhishek Khade <abhishekkhade69@gmail.com>
To: bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	memxor@gmail.com,
	linux-kernel@vger.kernel.org,
	Abhishek Khade <abhishekkhade69@gmail.com>
Subject: [RFC PATCH bpf-next 0/2] bpf: Add bpf_memmem and bpf_dynptr_memmem kfuncs
Date: Sun, 22 Nov 2026 16:08:36 +0530
Message-ID: <20261122103838.244974-1-abhishekkhade69@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series introduces two new BPF kfuncs for binary-safe
substring searching in raw memory and dynamic pointers:
- bpf_memmem(): Searches for a binary needle within a flat memory buffer.
- bpf_dynptr_memmem(): Searches for a binary needle within a BPF dynptr.

Both kfuncs utilize a two-tier search strategy (memchr() for initial byte
matching followed by memcmp()) and enforce maximum buffer length
boundaries (BPF_MEMMEM_MAX_LEN). Selftests covering boundary conditions,
embedded null bytes, and dynptr integration are included.

Abhishek Khade (2):
  bpf: Add bpf_memmem and bpf_dynptr_memmem kfuncs
  selftests/bpf: Add selftests for bpf_memmem and bpf_dynptr_memmem
    kfuncs

 kernel/bpf/helpers.c                          | 115 ++++++++
 .../selftests/bpf/prog_tests/memmem_kfunc.c   |   9 +
 .../selftests/bpf/progs/memmem_kfunc.c        | 259 ++++++++++++++++++
 3 files changed, 383 insertions(+)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/memmem_kfunc.c
 create mode 100644 tools/testing/selftests/bpf/progs/memmem_kfunc.c

-- 
2.53.0

