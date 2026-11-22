Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795342488;
	b=PjBthCZ+8GqgNv3ha3EtdxR+a4WXfqUzhYAkEDrQ5vaM1s2jDGxlW+dX/Q4wKSl20NkW
	 k3jsQME74mVZIXlqT8G38FcGnmPu0fJemNscaoYMtRlot/ZepW25tEQJyHpBwRusI5feJ
	 iTS3s2MdH/FibJO9/H9NIyrHHY/YOl+UKWjM5QNw6x8knQ2cVnCiZFNL2R7RX4Udsdeni
	 k4bjmd0jckcA4C2ahF1FMXghsvk2SlAW5l/k5ek9vIKYCU0McHVaE0UaSTYYFyIO5dLC1
	 xkmlKWya+7kVHCVKv3+n67ZLJ3w3Yom9Bx4B5mWpGhXn09g/uYcbbY/VVbpfhGWPaHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795342488;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID;
	bh=ouqhCTz8e1ZRJCnOLQkSSdpF0DuIultw4i6SPTlpXdo=;
	b=aMJtBUbPtFWuS5pTQ7D/C/LwnYXBT5i69UP3eWAMQb+DKkJX2mCnh3u9gbXDsPGirDN0
	 ce458zdaezKbJB2kambNHto+1A02jzFq1VmoPvgo4LswovO8xuvsuuEQzDB22WeBYJbcE
	 VaC1kdGz5U3dpuZ7vnRBF5DBArmRCCmJjf9+FOlp06KQkQB9BwpjsZLtaKJ0yOyeBy4Ir
	 2xG6RcHPNKnIeZQLWFYQcPiTZn595frWIhWEH6h2Bwjyn3d+r9VPGk4JmZLlIEuscAi/+
	 uXG5FL48WF8Mpm5jiaNzGdu7DcWFgNDLy4RvrIrqtD54Unc+rty4phAa5HnpBTA88QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aDHtyFnn;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8309606A330
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:14:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8309606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aDHtyFnn
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso23009045e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 02:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795342486; x=1795947286; darn=vger.kernel.org;
        h=message-id:references:in-reply-to:subject:cc:to:from
         :content-transfer-encoding:mime-version:content-type:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ouqhCTz8e1ZRJCnOLQkSSdpF0DuIultw4i6SPTlpXdo=;
        b=aDHtyFnnrzRBtyyZhnLselLVunVioNXJxNB4EW9L94a61SA06PRXZmc+GnmSXV/box
         iaAHTVrnRs8ObBKUlV2SgkLchAD1Gg5exAGml6I57wEAEE8CkMx283jLvJnGJgYwfxNl
         07S9UBEOuLbCp0RzRUPH9DDvGvrV8UujOKb3nAahk/QYa/QTczCXMZhMUvvVdna9RUct
         sfXxsU49qmORv24iGjit3+/wTQHJ8Njrey/8/vMahEUMN4olrlunYHXqPfYlgRSeAfJ8
         F1QYeyhKHrKMTTvIDsVf1BJep6E9Abmi3UrRh36o0TfvO5etYUsWf1tBQ5UNUM+EZ47y
         e0VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795342486; x=1795947286;
        h=message-id:references:in-reply-to:subject:cc:to:from
         :content-transfer-encoding:mime-version:content-type:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ouqhCTz8e1ZRJCnOLQkSSdpF0DuIultw4i6SPTlpXdo=;
        b=tVnAeoqvPp9VRVDq1k49Eh1lzDsLGcU2gfaLoN7xxKaTkWm9g8ZKYI5xwGrt8nK7tW
         gus5JMcMbRkSSumAINqhsFJ9jdF3VsAvaI/qDqBvpk8NKPgklBbPJ0xP/YpB/HOvIf4E
         6UGOh79odWe3rBCCGKQBAetZDMC3Sf7XZ8rBj4x2DF4x0tgRUDPHqU99QA9DSfB6fmw4
         DSXdm7TBu0XRzIpFaUtKSMx0YiqkiExPY3oX0vnPS+j9yBYrJfKhftCnSU9bi499Yu7N
         kBYt3PkmSD7Cf8Ghcz7YJoVHDv7STwbJApJoX2QoSW7Fs0k5vdbzIr/cuj1J4SY1wbT/
         fDMg==
X-Forwarded-Encrypted: i=1; AL+hErHwjUPKHK1egqgO5QvFqwR2eWLsxAg7rzn7tkyA5HDgrE6PSsr2gUQHjAemorJvWeIXrDP2LczqzsImze0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LpD5elqLkKPi0VGRBFnVwgrIQ4NkcZf2o2OTCOe5Rxg5QQZ0N
	MORC3Hhq8awocmC6HL5lvbM5rviObKogkm5EjqVYNwsvfTxxU6iOruGB
X-Gm-Gg: AZFdTZfIufSWLhtI6Ff+E2W+Aq9lGDA2F4ZOfDTW9eak6ETfYuxir2phgfA3ldB1Aid
	bK96oROLk/lYOks+xawkUN1C34XhW9ohV85QcsHGkpatQTmuRKd8cEMiDVfqZKpDtVXOSJXoFpc
	a0ltsnceRhmkGMgkAnsEs99jCKCRBAoCDp/6iiyIJndXAWjzN/ayh2bh9YQ6f2l7R4Ok4BE+yIh
	n2IeWCcFlejqTm8kX8MxNijLVKCHi7PQ9ZGRMtM128MpoXXpq5AVE7L8gPk+Mud42qz0YiE+HjE
	mEsBcrmRbf8GcEnnhE/EHb2GG5EOp46Pkkgt5Wk2Sn/2gY+I0jDedD7cNSYfmWKujrPP108ZaxJ
	ZXgn0BcywBPIRdIpx08USs+ORexiV+9DRHwrRwcZFnKL7az9H2pwF+oVMBznAH/29doYPx9oU2O
	GtE54TLolaHRVQMKYhVNc/jrg/AH0x7Q9TqbDRfkRS11yn1rFJnehgipEyk9ZtgePclrySlgmB2
	sv9ehOhv1GGzkQXMoW/Gy41dQuwIGMBqyk89sj/usRzdcdOtQ52kBbM
X-Received: by 2002:a05:600c:3b94:b0:4bb:6f41:39be with SMTP id 5b1f17b1804b1-4bb8880ca3cmr216757975e9.15.1795342486072;
        Sun, 22 Nov 2026 02:14:46 -0800 (PST)
Received: from [127.0.1.1] ([196.237.227.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb905f1489sm112778555e9.0.2026.11.22.02.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 02:14:45 -0800 (PST)
Date: Sun, 22 Nov 2026 02:14:45 -0800 (PST)
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
To: krzk@kernel.org, andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 yass27106@gmail.com
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: add device tree for Asus
 Vivobook 16 X1607QA
In-Reply-To: <sashiko-outbox-217692@kernel.org>
References: <45f11591823b4395aa19dd3a3ee6dc90@gmail.com>
 <954a5e65e7424694ba29836fba08c802@gmail.com>
 <6fc5be59b56e42728e33595d5415441f@gmail.com>
 <sashiko-outbox-217692@kernel.org>
Message-ID: <2920a713778046808ee4a8c2b12002f2@gmail.com>

SGkgS3J6eXN6dG9mLCBoaSBhbGwsCgpBIGZyaWVuZGx5IHBpbmcgb24gdGhpcyBvbmUgLSBubyBy
dXNoLCBqdXN0IG1ha2luZyBzdXJlIGl0IGRpZCBub3QgZmFsbAp0aHJvdWdoIHRoZSBjcmFja3Mu
CgpQYXRjaGVzIDEvMyBhbmQgMy8zIGFscmVhZHkgY2FycnkgS3J6eXN6dG9mJ3MgQWNrZWQtYnkg
YW5kIFNyaW5pJ3MKUmV2aWV3ZWQtYnk7IG9ubHkgMi8zICh0aGUgZGV2aWNlIHRyZWUgaXRzZWxm
KSBpcyBzdGlsbCBhd2FpdGluZyByZXZpZXcuCgpPbiB0aGUgcGFuZWwgcXVlc3Rpb24gU2FzaGlr
byByYWlzZWQ6IHRoZSBwYW5lbCBub2RlIGlzIGluaGVyaXRlZCBmcm9tIHRoZQpzaGFyZWQgeDEt
YXN1cy12aXZvYm9vay1zMTUuZHRzaSwgYW5kIGRpc3BsYXkgb3V0cHV0IHdvcmtzIGNvcnJlY3Rs
eSBvbgp0aGlzIGhhcmR3YXJlIHdpdGggaXQgKGlHUFUtYWNjZWxlcmF0ZWQgZGVza3RvcCkuIFRo
ZSBleGFjdCBwYW5lbCBtb2RlbCBoYXMKbm90IGJlZW4gaWRlbnRpZmllZCBmcm9tIEVESUQgeWV0
IC0gSSBjYW4gc2VuZCBhIGZvbGxvdy11cCByZWZpbmluZyB0aGUKcGFuZWwgZGVzY3JpcHRpb24g
b25jZSBpdCBpcywgb3IgYWRqdXN0IGl0IGluIHRoaXMgc2VyaWVzIGJlZm9yZWhhbmQgaWYgeW91
CndvdWxkIHByZWZlciB0aGF0IGJlZm9yZSB0aGUgYm9hcmQgaXMgbWVyZ2VkLgoKSXMgdGhlcmUg
YW55dGhpbmcgZWxzZSB5b3Ugd291bGQgbGlrZSBjaGFuZ2VkIGluIDIvMz8KCkJlc3QgcmVnYXJk
cywKRGFuaWVsIENhcnRlcgo=
