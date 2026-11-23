Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795449313;
	b=4/TVgIU3UD9W3IM17l+wEvuVb37uFFL6xYYGdoxg0TJDBGkdPNxK3o79PamzHygTJ00H
	 Z7BXLhYdZ7FyLLCOYwW0wIZkaYyQGABxXa+1EzY8NbYvg22gjgjo3mcUaTM79cceNhB2p
	 0Vt5VC+OlEs8oAvYTKf/0Xq5ry00enIA+TjR/45VNqpc3xgbE8hxfdcOanKeP3lYwHU0m
	 xCFhiDRnuy+rGkczdV4kHn50Hn777P68ZbyBiGUMwKs0EoJH82WXR6YkkcJaGls6jXKEf
	 4j+uzz+7yeee8vL/6iSdWueniAFD0ukps0vEh6OsH8mhkEiyFzwCR8+YUYukw+TBwKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449313;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=78yadV2O15NP1wJTol26zAS/3koPAeUhNSVSGjvnLZI=;
	b=QUQYM9wJj13GLSnGIub7vTssLnKuwbu0o6Rl/8h3yejP35yblLA2svQB7pgsF6m34orx
	 nVfGD3zwj4bHTNS3a0k8HDVtin+R22zJNys/IW7dCIfTYYRjtWph/rhuTAaVIpzcmngrD
	 65ZSrWDz2g57fP2NWONQXKrJsSKZ/s+ftkGcyF8lLV3yzE/4fKPpO7wxlU56gSb57AF5c
	 Jobnq27i9laQcTtbxZ9t7/5ULr6kTUniTT/q8d+ni03qy6X6QsT74+yA8TUk0gbyVaore
	 PR4pbyPAfPqEa6AwTT19QDaMCODtiKq2+WnzTQEBUzBVRBo1jW9ZhD3ioGJYkdpODpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oyi0sjgN;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D965606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:55:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D965606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oyi0sjgN
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-38564b4b017so3695467eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795449312; x=1796054112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=78yadV2O15NP1wJTol26zAS/3koPAeUhNSVSGjvnLZI=;
        b=Oyi0sjgNBfHQvcu4yp0AJdAbkH6qJCsirLuyq5oQ+mEhfMcUdDF68DxUROhirp6zV8
         j7uQD+oYr8i/JjJul5XMI/HkCbjO5U6Dqub3rIxbrMNSX0+Ski8HfZZNOzlV8MQmUv3D
         tgW0hAf23nFZJSVY0rf01lI8GOPOlEFyn8KItGbiKuHaC7ZAuZxjiNN6UxAmevEI5svG
         QBFhRNrqTiXqp1tE5P2wV316RTKWp9aWjmwqJcD4DoC7ibSgNuLyFA+7ekM2JAJ7ICl4
         KnrUKKn19xTuSHAgWEzO9b4DFrx8k8943tEGikmv9Xw2BD5He7BbILG27+Ln8WngMac2
         m8Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795449312; x=1796054112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=78yadV2O15NP1wJTol26zAS/3koPAeUhNSVSGjvnLZI=;
        b=EtNPaYjh3LPE3roUgOdpqpDMqMwkbmx4EmKip1QOiZlNJvCpYXYJtdED1ijwHM9OgC
         ajkwfjx6aYP3WEz3VqDv7aJ5x4RAcvtqo3JgtNgfyjI4/SlQS7zpmrcI2ATsv04mabUA
         5VYBh9RoBjyi2qA270bZYUP4qG6FfvzCnOD6h8rdM884ac9Fna70OZ+mrTTNFGtn247M
         Bgxd8XgwXM+jyrDJ5pAIYv8TKRc75rzI563iPK7nUT7u9kuDOV/ERYyGWBtQFenrXXvc
         0V6C2AVYDdhh9OAIDCj7khI+ISWdrQm4x9OscnCoC5uJpcIobA8hMqXk3vXaYDKqCutP
         JZAA==
X-Forwarded-Encrypted: i=1; AL+hErFF523ZS1O31evoY7KN0uEFPpCnjr/Z9QzTE60DQmVf/tx2OfG0q31uh72JYH/AkoCm2seyuxnnqIes/7w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Keiz5QEio4BbQ4tb5aqL72n8KpCdr5n0s6/jMuiiEH4CBMRMx
	zV5PiUtpd/n8lIIxhP3OY1scg/WGr5oL00CKa1VsjC1enXEkeEW5U7Dr
X-Gm-Gg: AZFdTZc32RM60shUC1RuUg2nwJ1YPE40QyK/dZzWysNFD6LRG+9kFcpmV1c1pd2CFde
	hq2JuQgha76ol4vSkellBf2meaqYbRE4ETLr/dt9xEvaU+n82ZNT4FfwUpwLKr6pqFXWco/rEV6
	sXrqsQOUFS8o3X+nU72RHo3YKu9O25QyEzqOG3Rcn3rPPjzbS/Bc8YvS4o5i/90JVUY0rjN/uNG
	HfoPbMlzqnHPJbpm31ezTfJmBlcG7Zf1qrXGgSsOsabRfetMskrsBiOSog+VSTvdTR8ccAXJcIl
	stSP0ykfTAJXVG5h/08yXVk4dMj4J1qNVL/XZNxhqxQffsFDSJlfMPHF7NkcHSSt4qQ/oZg5neF
	WEPQoghLPgRgGUinF/bOGCYJAmFlZ4McHEuDI5yudI9/A0quUbcmTgrlJvsTiXSFqlco+YPWaeY
	/ADGuagxkscxyxC8DRIM8t/H8McwkmX+Eg4Tt4pU+nqLjElHWeOfIquv5Haichw7mAhTKv3Em5s
	ktHq+36Z3UTq8YtO/JVuXQF+QDPA0MREHTOXU48AUbdGsO+ppzEnYqt/v7oEsn+nGTzcEOafl1P
	6D9Jvqxug8w8qKbrBVs+ars9qJCN3fwaRmIw3VKHxZLOUkEJURTbfRtWyvKo6/brN2pYDOcMB7r
	6QaVG9RzvU/6/LLx6FkDNfVcD7ojm1DLtx4A+QWCuZQAfc6HG7ridviFJFhAuYmdzHtkKfO3oqw
	==
X-Received: by 2002:a05:7300:d112:b0:385:7045:1736 with SMTP id 5a478bee46e88-38570451c98mr11669850eec.19.1795449311155;
        Mon, 23 Nov 2026 07:55:11 -0800 (PST)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm13723517eec.18.2026.11.23.07.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:55:10 -0800 (PST)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	idosch@nvidia.com,
	nicolas.dichtel@6wind.com,
	jacob.e.keller@intel.com,
	jiri@resnulli.us,
	fw@strlen.de,
	martineau@kernel.org,
	v3rdant.xiang@gmail.com,
	aliceryhl@google.com,
	linux-kernel@vger.kernel.org,
	nhorman@tuxdriver.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	anilkaushikwireless@gmail.com
Subject: [PATCH net v8 0/2] genetlink: Reject joining multicast groups no family owns
Date: Mon, 23 Nov 2026 15:55:01 +0000
Message-Id: <20261123155503.2497063-1-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
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

genl_bind() lets any user join a multicast group ID that no family owns.
A family registered later can get that ID, and the socket stays a member
without a capability check. Patch 1 makes genl_bind() return -ENOENT for
such an ID. Patch 2 adds a selftest for it.

v8:
- In the selftest, read the group memberships in host byte order, so it
  also works on big-endian (Sashiko).
- Skip the selftest outside the initial network namespace: the family
  dump there does not list the families that are not netnsok, so it
  could take one of their groups as free (Sashiko).
- Close the selftest sockets, also when a check is skipped (Sashiko).
- Skip the drop_monitor check when NET_DM gets no group ID that was
  free, so it cannot pass without testing anything (Sashiko).
- Rebase on net.

v7: https://lore.kernel.org/netdev/20261116124030.1595567-1-anilkaushikwireless@gmail.com/
- Add a selftest as patch 2, as Nicolas asked.
- Say in the comments on the static IDs, and on NET_DM_GRP_ALERT, that
  they can be joined only after the family is registered (Sashiko).
- Say in the commit message that the unregister window was already
  there for the capability check.

v6: https://lore.kernel.org/netdev/20261112094205.1120090-1-anilkaushikwireless@gmail.com/

I used an LLM to help write and review the code, the tests and the
commit messages of this series. I checked and tested every change
myself.

Anil Kaushik (2):
  genetlink: Reject joining multicast groups no family owns
  selftests: net: test joining genetlink groups no family owns

 include/linux/netlink.h                      |   3 +
 include/uapi/linux/net_dropmon.h             |   2 +
 net/netlink/af_netlink.c                     |   6 +
 net/netlink/genetlink.c                      |   5 +-
 tools/testing/selftests/net/Makefile         |   1 +
 tools/testing/selftests/net/nl_genl_mcast.py | 127 +++++++++++++++++++
 6 files changed, 143 insertions(+), 1 deletion(-)
 create mode 100755 tools/testing/selftests/net/nl_genl_mcast.py


base-commit: 7b0c5f0c757cb61e28dc4128633877aaa8f6f9bd
-- 
2.25.1

