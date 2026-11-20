Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196625;
	b=ir0rBGLT72sYHVroMHXW0KPnouj5wc+vrzudhzrocOi5gGjmVxp6nMVAagioNMTyRWtp
	 +3Gqm0cqP5ihcETCufeaeypaJqhz9Wgur3V2mkvP5/AmTjHenkYE0pVSjpt+CCPbMkSog
	 q3Nt+Jxqax1n66dHJ6hTH1Q0OxCNrw7t9TTN0GDP+Pq48CPaGFs2Zm58ZaSoD/Rs+HcfY
	 qfEchQzYeOino6ISFpcI1mUNWR7s4EeRW4ORVhUwyAX/cKXlzw91Fe+UHbOCw8iVCgft0
	 U1lRw3PjzM0O+sC1RQw+af5x9jpc8/K5MG9c8DMbO7B7adFVnRAVeVLLVVk2oDxUnSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196625;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5z1EgR65emUydSCqho9zKh6KfG5YB5vPm248oYuEGq0=;
	b=OvKAYwi7ke7LJ5gFgdjukuXZpfABGp/JaFi1q8U/D9In1jbPGIqm0elmCn1NjvJdgyfZ
	 V0vAqAS5OGdOoY998/+LQ67EmYgbP5HrNbw0nVvn2wPteNsLWyURH2L1HmFYvM6GjUNNd
	 oeRMhXhC2lcUYeng4HHryIOnhnEd2TBO7o9fHgUu/8kYT4/WggrgtXGsVT7LThgOvIPjW
	 AVJFk0SSLA+uwkmrIVhupWdVEAdF6Bv4B+tNspGse4lumFb+GwqWHv5Ul3gqMdrTn5xTz
	 jEFGgqiIpT98+VAucaPv7fzarhzMwEg0UpcDCZML4nbA7cpuUhCLwl3wEYL4j3J7BMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="znst8q/z";
	arc=none smtp.remote-ip=209.85.222.45
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07554606A7C8
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:43:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07554606A7C8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=znst8q/z
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-992f6d8cb51so262871241.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795196624; x=1795801424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5z1EgR65emUydSCqho9zKh6KfG5YB5vPm248oYuEGq0=;
        b=znst8q/zgI1dTcSh+97WdgRu1/7fSZ/YVcxApvB9sqUs7XECM7vkrHOqnlyTsAkq4m
         Keo2PN2Fle/zyfoibUcwc/l3XWkZFvnbQN9Riw2C+YFt8webA6Ld7xML3JuFTVmKaz9K
         0tLV+w0Z5Cd4lD0CWM8pIZepoDQEuFQrTZrYy7lRgzsaFboJiL9ieGwleMa01Au81/yR
         sJnXpsssLc6Cun8Aj7JFPkxio/r6ebHLYTLvyXy+3LSRNou1x8M4nVl2vA9Xpa3Q61M9
         vE7cicjhqH02ympWsnYRYQn6gk1P7buW0QYksCRuPOCf0vkn3lXeN3EPjoxdyXW/Xiii
         kpQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795196624; x=1795801424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5z1EgR65emUydSCqho9zKh6KfG5YB5vPm248oYuEGq0=;
        b=uIFtENvRVF+7wIPOTL2Njvn1BDRDqfNDSo1Za3yTYIKm6iVBrZy+6XoRLimPk/psMO
         bFDNEbU603foO0Rsa3h9XY6DBezSmfMgAY4pIrEiOwzhPgnayR2Vq+5JVG4tF3AJLyZ+
         x7LzrEVeg85JEQH1oMu+jLAnHiCnCRaceXyjSMHrY8QBie0qORZTGiVYjn5sPMcuZszG
         4aQ3LCAhYzZGwJygUlCc6SJDkMZWatLm8uZ/tFw1wSUimEq75RlMIpikvxY4dbHFjGX/
         +iOUSRkwu0iYf8lam8tifx3vVnT3gaMkAytNPkNPDY3lcqvDG2SlW6jsYj0UPuZU5vj/
         dHPw==
X-Forwarded-Encrypted: i=1; AL+hErGDjTM1l7n2wvL6LLJgiLMSWlLo0cLYeSMl8czEHeUfh5+/hV2p+LCLaRA+L8oHeIyHO4uJBKJ/kESRQcI=@vger.kernel.org
X-Gm-Message-State: APuU4Z87L3L77twyW8anDlupFDoprYy5k7UbbM8vIpgaI/FaIiMmXCg6
	YxK8ZQnVvx7Ve+us++bOgw95ujeeT0a9kgXghRRst0o7Tpq5qkdzV076
X-Gm-Gg: AZFdTZeDTlW+ytUGTZnbwMPsluR2zw81oUIi1Wt+Dx5uBnG5LCV2vv6TUB5uhJdwV9w
	BcAb0kdW4qrHWRZCcWiUmswdiOKCmpUlSTPCOXrq1FEDgW/Oqoi2ggJuyXln52DIX3zTgcxMkY6
	G0x1e5JmcUESxkjKChNB8N4USSFLafy3/Vfh8JnD0FOxamw0tc/LRuGM09IqbWZaJja4JcP3v34
	/UobRvX3TVGE80avRYoOKLhL7c47HsIL3md+IDXicrUkCYpIzJVm77vfmSHj7Iq0OFB0qRPSkcG
	OhWhUMOIaQkyE6q6pZ7kNkTpwjF+TjVQU9X9X8pgsqY61JKNaiE8m+8ikzGnN4wEI25cjVzS/YG
	W70MleadINB87VCd5wN/j4fjl4NGl7te8+/dXffjZNgy4QBjlwNcOcw7C3wIq/4KOUafhZSBsvU
	HNia60CE558GmQGR6MYs0qn5VwDS/U7sccdprJ7xP98brxI9Ons6+pR6VM3F2StAFRDBDUHVM0W
	O0MZxpFQXf2JzpwR8Y3LqHRLB4iOejEt6NJf7OyrHo8eh4xMQE01WJiyQGyRdfbnTNDmEcX7j04
	ojgdTo6rGgVlLfdr2+2l69jqM4v21MPaanfUnCQoUQMQhgU7Si+W5tWcuR/oWEtONhG6AA==
X-Received: by 2002:a05:6102:3f13:b0:7c3:9a36:bbda with SMTP id ada2fe7eead31-7d72b368b75mr1845474137.5.1795196622985;
        Fri, 20 Nov 2026 09:43:42 -0800 (PST)
Received: from localhost.localdomain ([2603:9000:d440:53a:a9cf:4432:7fb7:e8])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e7d784b3sm3571363137.2.2026.11.20.09.43.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 09:43:42 -0800 (PST)
From: Juan Agustin Niccolini <juanagusnicco@gmail.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Willem de Bruijn <willemb@google.com>,
	Eric Garver <e@erig.me>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 0/4] udp: Fix bind conflict check bypasses
Date: Fri, 20 Nov 2026 12:43:37 -0500
Message-ID: <20261120174341.35873-1-juanagusnicco@gmail.com>
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
Content-Transfer-Encoding: 8bit

An unprivileged user can get a UDP socket bound to an address and port
that another user's socket holds, in a state bind() would have refused,
and receive that socket's datagrams. This series fixes three bugs that
allow that and adds a selftest.

These are sibling vulnerabilities of the TCP one fixed by my
commit f675070191f2 ("tcp: Fix the SO_REUSEPORT bind cache admitting a
conflicting socket"). The one in patch 1 has the same kind of cause: a
SO_REUSEPORT shortcut that lets one matching socket stand for every
socket on the port. The other two predate git. All were discovered
during an LLM-based audit.

Juan Agustin Niccolini (4):
  udp: Fix bind conflict check stopping at the first reuseport socket
  udp: Keep the bound device on disconnect unless connect() set it
  udp: Ignore a connect()-set device in the bind conflict check
  selftests: net: Add UDP bind conflict tests

 include/net/sock.h                            |   4 +
 net/core/sock.c                               |   3 +
 net/ipv4/udp.c                                |  69 +++++-
 net/ipv6/datagram.c                           |  25 +-
 tools/testing/selftests/net/.gitignore        |   1 +
 tools/testing/selftests/net/Makefile          |   1 +
 .../testing/selftests/net/udp_bind_conflict.c | 228 ++++++++++++++++++
 7 files changed, 317 insertions(+), 14 deletions(-)


base-commit: 19a227903e65c7a9c179156485660a4e017575fe
-- 
2.43.0

