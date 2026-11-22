Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795362070;
	b=iX4noj52flFmrpqK/rpMXlusPk30WVATQ1esiRXgAkrRGMsaAthy4c1rcLPyPF1QrO4V
	 l0fyQl0D/+x0zyZe30qeNUgbhVGmcsa3Co2ieelD4Gh1UpJaq7SMARG9LGeo7V+fJ8E5O
	 x4JwZNpbE7RP7GkCl4o4j17KFRWG9VyrQYKxMHtSosQD6cYZ+QXpBg9UFY2Iiair9UwIO
	 THDfChhBBP1fCjrY6bIgobR5Am6c0djeGckSEBGe4JIggarDmR8WmvHNKrbAHCdszmiSO
	 BO1Fkk4Q6rxt9wttE82GpVLS/j/1qiL2DCbfztU72gpo60jHzHnhclwEgAr2OwjlZpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795362070;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID;
	bh=x0Gj7XdrXAPRpCwdyxefzNs9ruQYDHS6265gpVziOPI=;
	b=GjaJKBOY1r3ZZyV7ye8bNoMl4JmU5RuUyOcyh+q0RpdKWTXHntBnLnr1PrVkQKRLvnQZ
	 PNHHBa9lZD17fEcwTjpOpRzjml+emjxfYJ/zpYHYOAre7foogVkIxBdKAxlaGQYbWE3c5
	 AalzF1WXb/DiMahvrdOmxIYFHJFZ8Eowl6fAfsSzHFRnwnSjT8KkvUujZDAe+ZjL0xxu7
	 yda/eFZEnpx2pN99t04vLfekbmoaokwE7rFY7VBPUm9CDGnraaBCUXC8VxcuOyuvlTIaT
	 DxIcCCDXYXrPcDXiXLIxvlHCE2ym2XxtObOxk6DIWjlq0zNg7jR16hnTKa57CWBgCKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aF7PRWXc;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9C7606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 15:41:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF9C7606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aF7PRWXc
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so22919245e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 07:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795362068; x=1795966868; darn=vger.kernel.org;
        h=message-id:references:in-reply-to:subject:cc:to:from
         :content-transfer-encoding:mime-version:content-type:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x0Gj7XdrXAPRpCwdyxefzNs9ruQYDHS6265gpVziOPI=;
        b=aF7PRWXc0cLKKbQEjH/NWrxHpk0VSt4Mb98W7lWcuTXny9UwbVQjWNgdaTnkALpRnk
         ux/9n6buSQRz5KI+3QLBJxNTc6MUL/3Z8pukSMMvpI70jSCBmFOxhunBAjmFon5OUlw8
         j8OPqHV2y3RIwcRGxnktk5JPhwVLXFh8TlC98YliUQXrUK7di3eUuwqTpBcyymRaglaG
         xyyR8E5UJTiikMyV02fX9tHJ/uBmGGBQyfCCJYTXbaoVH0N1QFVz0kcVXdDY9vlJIm84
         r77wwS/7ZPpbbrad9ITagWEzOdLJGFlIqjHs9bpxtCSxmtc21k6nmUljdxekl0bDq1gH
         HOag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795362068; x=1795966868;
        h=message-id:references:in-reply-to:subject:cc:to:from
         :content-transfer-encoding:mime-version:content-type:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x0Gj7XdrXAPRpCwdyxefzNs9ruQYDHS6265gpVziOPI=;
        b=FyoiwHiWbybQs22f9/4gFEwSPmsf9VTGEI0OiJwhgsNcnj6IKWRDzdAZlpzUVDYgVl
         aMmJdVbjXK9Oia9mnfvWCKXKA+iAFsntfC5LTsvSM+7N4BfDLeKG9ekIr7nIiYpnOFIN
         ntjzVRFhVhYmT7hA35grbBPw4tpJk5sArE0js9qsMu6OKQ0kudLO1gVJ45/+dfD/kDSq
         HiTzcEjwv3jA+YB36IQGccvCt57laWn54QOT/cP4K/zQKnChgla89wXvPJWchoW50ff4
         hwCsF5V91+0P6itnpd2/PVdW1OyXB7YGNlpQGZ/UyBE4A6Nz0R44YDpzlpDat7+ZOVi8
         UcOA==
X-Forwarded-Encrypted: i=1; AL+hErHCFOU74UhStF3skjo1LkVW+Wg8FyoHYzAhAg3YStnQFK/ZOOFafDgaJ5b4JQKY1/FsUK8RDp770BmtziU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5tS40PEFjc9kmxFiyZf2UXc65zdaD7SGnQNcfAoQe/8qSjFBg
	Zxfwvk2B4O2jN7WOsabmzg0C4D+n4U5bSJ2mCwRanCcEDj3io3cKPuSe
X-Gm-Gg: AZFdTZeWst3F5mH2XV3MqGNWSlPaEmutRMyK8Q3PVAY67sL/4DOwUC+7b9HzKUB1OFV
	WbPI1fVDELxR/04nfxcxAmvao1rMmAb+eAIXMi8yWOI6+DSBG0s/BN+gfrFpG7sTW8LFf+AInZY
	8kSpDzI75ZF+Kebiqxhj7h3+ubsY1vcnsgaD55GWgsBN8RuFgJBI60UmkQHQOLoWC1o0Jr3XdsE
	9mTPRKwFw8M8mBZwbGDL9BUF+rFAuCmBf91U1JyUfWtvmf3TiaBxymGn0MWQ8g3xPwX6aFXw5wo
	GJRbkhF2e2BHE9bgMSAi5NfTZStIsOFIoB3lUD7RpgD0Mj8vXLHvxcdDiybBREF00qJuzW1xUoM
	svbxo+k83TXqiMiLx3CMIG4O8jZVmvPM+7rP02LxKAgP+rUMSU3y5Dsffi9Oe679Gr+m8eFA+0o
	ftqR39AfzOTL72KspPhzurEq9NQi/f+tI7TlkDLEdFSVSzSLaZ3pn8ezNaCLFj8oDXcZ73Eopkf
	5+MmLTsb8IUaHM0/kwkJHNDQKa9FhEn9lSvc827/3XcFTgI2MDeJ25/
X-Received: by 2002:a05:600c:3113:b0:4a2:267:25b3 with SMTP id 5b1f17b1804b1-4bb8882a4b9mr201760365e9.35.1795362068140;
        Sun, 22 Nov 2026 07:41:08 -0800 (PST)
Received: from [127.0.1.1] ([196.237.227.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853ca452sm276634245e9.15.2026.11.22.07.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:41:06 -0800 (PST)
Date: Sun, 22 Nov 2026 07:41:06 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: Daniel Carter <yass27106@gmail.com>
To: vkoul@kernel.org
Cc: srinivas.kandagatla@oss.qualcomm.com, andersson@kernel.org,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, yass27106@gmail.com
Subject: Re: [PATCH v5 3/3] soundwire: qcom: check clk_prepare_enable() return
 values
In-Reply-To: <c15d3417cda640aebc7bebff76b0448e@gmail.com>
References: <45f11591823b4395aa19dd3a3ee6dc90@gmail.com>
 <954a5e65e7424694ba29836fba08c802@gmail.com>
 <6fc5be59b56e42728e33595d5415441f@gmail.com>
 <c15d3417cda640aebc7bebff76b0448e@gmail.com>
Message-ID: <b9a72d2ad40d4a8087acef99a7bd2fc8@gmail.com>

SGkgVmlub2QsCgpBIGZyaWVuZGx5IHBpbmcgb24gdGhpcyBvbmUgLSBpdCBhbHJlYWR5IGhhcyBT
cmluaSdzIFJldmlld2VkLWJ5IGFuZCBjYXJyaWVzCkZpeGVzOiB0YWdzIHBsdXMgQ2M6IHN0YWJs
ZS4KCk9uZSByZWJhc2Ugbm90ZTogdGhlIHBhdGNoIHdhcyB3cml0dGVuIGFnYWluc3QgdjcuNC1y
YzIsIGFuZCB5b3VyIGZpeGVzCmJyYW5jaCBoYXMgc2luY2UgZ2FpbmVkICJzb3VuZHdpcmU6IHFj
b206IGRpc2FibGUgdGhlIGludGVycnVwdCBiZWZvcmUKZ2F0aW5nIHRoZSBjbG9jayIsIHdoaWNo
IHNoaWZ0cyB0aGUgcnVudGltZS1yZXN1bWUgaHVuay4gSSB2ZXJpZmllZCBpdAphcHBsaWVzIGNs
ZWFubHkgb24gdG9wIG9mIHlvdXIgZml4ZXMgYnJhbmNoIChhcHBseSArIGJ1aWxkICsgY2hlY2tw
YXRjaApjbGVhbiksIHdpdGggdGhlIGVycm9yIHBhdGggc3RpbGwgcmV0dXJuaW5nIGJlZm9yZSBl
bmFibGVfaXJxKCk6CgoJLQljbGtfcHJlcGFyZV9lbmFibGUoY3RybC0+aGNsayk7CgkrCXJldCA9
IGNsa19wcmVwYXJlX2VuYWJsZShjdHJsLT5oY2xrKTsKCSsJaWYgKHJldCkKCSsJCXJldHVybiBy
ZXQ7CgkrCgkgCWVuYWJsZV9pcnEoY3RybC0+aXJxKTsKCklmIHlvdSB3b3VsZCBsaWtlIGl0IGZv
ciB0aGUgY3VycmVudCAtcmMgY3ljbGUsIEkgY2FuIHJlc2VuZCBpdCByZWJhc2VkIG9uCnNvdW5k
d2lyZS9maXhlczsgb3RoZXJ3aXNlIGl0IGNhbiB3YWl0IGZvciB0aGUgbmV4dCBtZXJnZSB3aW5k
b3cuIEVpdGhlcgp3YXksIGxldCBtZSBrbm93IGlmIHlvdSB3YW50IGFueXRoaW5nIGNoYW5nZWQu
CgpCZXN0IHJlZ2FyZHMsCkRhbmllbCBDYXJ0ZXIK
