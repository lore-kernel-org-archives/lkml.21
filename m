Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991567;
	b=C/EGOqN8xNmWaSscnJB00X3iYess8ZeyyTmqSv/aNnUNCpRiw9Z+mR60163tCIJHH+0E
	 ZTWTpO89rxdycVq0DiOZ9XL1qKnFEjOfRkHoeKhkmOPRijCgPLCFSeAtw23+45ts/WIa/
	 PeMaItzBn9zTFzzTZiZHGazzCxSwEToyE0m09e5HQHdTJ70/nbuxtxq0r4G0BwCiE9OOV
	 Zu1vFA0byNZ/i8JkXWyqsOKv0ZB5YoIQqtnguUPqaNk5hCGTqyPh2UGu633G6b/54DmHw
	 VGBpmc04A7X7AGlneo8ACxTG3yVjXzBa5721LERGY3c+pKwcd1a/RRMXSq59nX5FMvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991567;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rH7dHadXHQBCAb1xibb6d+8zPhNSRfeCjnCBhbphGSo=;
	b=yDzXoVt39/c3Wz2spyrYmbTzXk6SveMUehwYTTdkL3fYVq63P8AxUqipaJMpKF4KCDr4
	 n7jn1eSBEI8ybIvrrLXiozkV5c/MOP6c0S2HQFPFN9teqNZvRN263QXrW+vSOl21s9IZn
	 p4Q0clI9ZLlF6APchTUEOoqoerDTbBmcRPPcUAbYSThDHLi9hc+TEahOKYeFvdJ5HQPmz
	 zdD7jYRWbPhPGZcO6vjh23SHBpCgw50P7n++ybs8lYJUj+q6tJnogVLeC0pd2QwMCSBgE
	 bN5WY72Kvpfn7iimWhq5KrNUgRFBCh8iyrPvjDQE/7Rphti1f45DK0TKvb/3Scpu+Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EEW8WNWB;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D27606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:46:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0D27606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EEW8WNWB
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1b244fb7fffso777197c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794991566; x=1795596366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rH7dHadXHQBCAb1xibb6d+8zPhNSRfeCjnCBhbphGSo=;
        b=EEW8WNWByczu4ke+zSMCDWYT3ytnREhs02FtgVDVy97uFVL1M63IfMMn7i1shDNIKY
         EHSikcxcfwuXcY0KfiJy6NQEm98L/FTxMsIMMWTrnD+k1ngKNWjyIYCAaCTKsf3cvtNS
         2RzaOW6cjqRgjb42qoR+vz9uP66wtSwosjEi5ZwXSudA2RIVOUvqfEqWBgrcshrgkmrx
         ZrlL3LSBpgqvO8fYOTZxP9c8C2qbTjPSLhMJ99yDNDotRugINQDbFm6lxFzBZQ8crz3w
         OXmmDDcMlxKevtFaB50JGyJVMqF2axaLqGv03HguhlbVU/sINHXD1T/jFB8xE6MrbaCE
         2npA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794991566; x=1795596366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rH7dHadXHQBCAb1xibb6d+8zPhNSRfeCjnCBhbphGSo=;
        b=X7pLn+HdHEKJt2bMIeTap4m3gArkcErQujw/Ntc64JdHQwKWmCzXVEYklcW4UxK5AI
         nG6bGzKiO9VvRpTtmGj+OA70UOui/98fiYbAAbHJ8RuflFJnJP6DzqNXQdBG/mPIMTpe
         eqRnzGjBSouVPYdw6cqP0o7IinBbucgG4aQyDWpsptuduywAP5C8hDzkxgrQs9+rOj0k
         PwukNiaDx1hT+9TOtUY4Shghh0meKE9OlfPTNVWpzcLWBX2Y2kvG5h05oKQjE8pjuSzM
         va18gj/QVVahqXNkIcBQ/TISp4ik+q3RRxAwP2+mGP3Qb9+KH+uUmq6PVWh2hw097Me2
         tvDA==
X-Forwarded-Encrypted: i=1; AL+hErGZuoRG7IoBj3tobzNeqDrTbfNMn9jr3nYrNiLF8F3e0MoyUauoW2/tV8tClLj/J0ZD1m74gpxdZc2z+DE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CMdb8r+tDwISQMgOfCAF83BTHM1frelXLSKSXAKsUhfJN5UTK
	41gAo4MnhnLwppQeV5TJ7vZOSCePx/3i+gI+et4Dxo0iQNmSoq+W6E2Q
X-Gm-Gg: AYBFou1Oh7l7TNHzsxwRFO743p4qRoNatKydRuL68zoatuCUh+TFK+ctBpyiWLwEH/k
	/iAtafgKrSyGxwPP6tlJgXD3Xm4yGoJ3erWilUIcAlOelUdgYx3qXqna3Z8baJik5RCzcQF4cvK
	GfCnLPK+lzSKIhcr78HPZdFooj10lDjBcyoE7mnMnLKZvGiRTI0mH7lQZfdRlKEWlPQSo9ygmX0
	ijUJAOa89IgvHlauW7iYmDZUFub9SbzzIHpOvO0u9OyI4gJdrmmoxZZAKls2LCQNM3q6wHMteJG
	lj94/YasGkVsJOfrZtVX06PWg/NYFOoFlhu8eC6Mt254AWPdavmBDFYBH3jdWl0BkWEtbCpyPiN
	26Y4kkjU9PyBERPtPK0uQLPLeTJ6UL67PwqxM5bCTqo0l3sJcUqoGXT4Tj1VoF8icW//P7GfF3m
	low6uHWlAWIRKLQ8m7Iyw4EqQxjnnW7Bf2gohyEO5PknZWhqIr4UwDJPcivmJWW4+pvZgnF97uJ
	hSfJ8JxGcTYof30JevbnsL9zfvQPMcUlgAYriTZwnpXrtTogRT/FDcG13bCFxAZTEeYnJv0TOMX
	/Cori8RP4EjggRy9n8achbU7H1mkC79UATyrE9n9g5ELLOkL9KmOb50d
X-Received: by 2002:a05:7023:a4b:20b0:1b5:32d6:677f with SMTP id a92af1059eb24-1b543cfc722mr1753116c88.34.1794991565842;
        Wed, 18 Nov 2026 00:46:05 -0800 (PST)
Received: from zypulse-in-radeon-MS-7E24.lan ([2406:da18:1601:7200:e02b:e41c:8db0:668d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447dc5e9sm7220671c88.11.2026.11.18.00.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:46:05 -0800 (PST)
From: Yuen Su <zypulsecore@gmail.com>
To: netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Stephen Hemminger <stephen@networkplumber.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org
Subject: [PATCH net 0/2] ipv4: allow route dump replay with nexthop IDs
Date: Wed, 18 Nov 2026 16:45:08 +0800
Message-ID: <20261118084510.332821-1-zypulsecore@gmail.com>
X-Mailer: git-send-email 2.55.0
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

IPv4 route flush fails when a route dump includes both a nexthop ID
and its expanded compatibility attributes. This series fixes the
IPv4 kernel delete path so that existing iproute2 can reuse the dump.
If a delete supplies RTA_NH_ID, the ID determines the nexthop match.

The first patch limits the mutual exclusion check to operations other
than deletion. The second adds a regression case to the existing IPv4
compatibility test. The route type and IPv6 changes discussed in the
earlier iproute2 thread are outside this series.

In QEMU/KVM, with the same unmodified iproute2, the new flush and
route removal checks failed on the base kernel and passed with the
fix. The three selected kselftests passed all 36 checks with the fix.

Codex helped extract the IPv4 kernel fix from the earlier iproute2
investigation, add the test and run the baseline and patched guests.

Earlier iproute2 discussion
https://lists.openwall.net/netdev/2026/10/26/186

Yuen

Yuen Su (2):
  ipv4: accept nexthop dump attributes in route deletes
  selftests: net: test flushing IPv4 nexthop routes in compat mode

 net/ipv4/fib_frontend.c                     | 5 ++++-
 tools/testing/selftests/net/fib_nexthops.sh | 7 +++++++
 2 files changed, 11 insertions(+), 1 deletion(-)


base-commit: 2a324a58a084c5cfd7e5a2f55e0786bee170a4a5
