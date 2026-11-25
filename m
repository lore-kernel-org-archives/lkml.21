Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617924;
	b=4u6GqjQQU62uOcrkX3TI5c+C2zyhEKERoK7xvQW/2N2gArO/PSxKIn0XkaHSngCd88c+
	 cuWX42vNfGhuOok5GgobxJVWOWQ9zpMlZSfhRlqtr2g4uhn6psqqE0i/EOBSluHqa+kJc
	 gW0RLrnqXlKIbg2MD1QjM6IRAzZ7nvPM7VSybAByxc/mspWkmgDDEmUsZ5yEygbO+Icr4
	 WGQaplJdfWVb9/wTDBii0+i2OBOzZ336jhnxTkGddOWm0WRhVe9WabOZ9rwUDmmDHcGCt
	 XMPj8cT1LEGeUMKb/NA/CFEQ8n/GTMpCDYussap7VjSQatpJg7uI5vtsEAECV3MJDiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617924;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TZZGnQrheCo8IwMaTwJvzugJ+PAdxbUJ+yLbatzIT1U=;
	b=s3o7EFo8vQ/blU6+r1rT284MK1yR7uAEqmLSLcIbUX+tISfAduI4Mi5WM49BTRUToVfS
	 oh+jZ9End+vqreZeE1MOQVT64ZSb7CS9qE4vP6RKUHJrOHC3WkEZx6+RuRgx5TWp+2kXc
	 4oA2RTIkLYIrrsdO9PjRq1R+t2a0/e+mC0gGHFxJCW/iVCaDnSixFdKIFC/vwHWeD7oIJ
	 iI9cHvRzx+BhuLJf98CaMPtvvapuWoR59ii8hOUwk5s6cJDa+Rlcb3L+5ZbXG0860H0DU
	 TAklWHxloMBnjsUDTsbB/b2NuxUBySWlEBZKHxK9kB8scMvO16hCb25GySMbZnUGCjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mMmwuHsQ;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67636606A334
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:45:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67636606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mMmwuHsQ
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-38644aedba1so8886998eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795617923; x=1796222723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TZZGnQrheCo8IwMaTwJvzugJ+PAdxbUJ+yLbatzIT1U=;
        b=mMmwuHsQTz9kmNflAogL29vlIOmuNtu8dbedOUK2++NCoCfHO/vByKQkLx8ikeA9go
         fnH8zjdx9zlapJlv2iSns8wdZx1jqOIejPtOPia0Kptnj2nBI2D3wuVLZPj0pnbgQpYH
         vZFb9H+Fo2BfMY7kPYh3bDridF5wqwVs+8wccnHIabthKG1dDR01qm4MJGt9IaDBiDOH
         POE7EuO6lGXK5NgGPYbxjOG/fuQaGP6vpNPjBX4bFm8JkBXfWRnEtzEIlV8yQ6kfT+tH
         N8/xtSsAZnJIhUK2AvaOKbWEbozf80IwTrF7//wr4wYPLVG2kn7p8XqVyO/0ueqdL+75
         oeiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795617923; x=1796222723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TZZGnQrheCo8IwMaTwJvzugJ+PAdxbUJ+yLbatzIT1U=;
        b=s09DV1kzjbVhlRI2rLhN75OXrYjCN8MjGw0raApvlOMuvAFpX95HPKeg0T7jq+Ljtk
         qWbv8DbjCIliEP8yCv0Z9wCGjgRfpPQ7iXzzABESwdgq8k0UCMYl33cScAdGB2ER31t4
         R6JUS4OKTblUVbHc8vzyxKeiBvwZPQhjWJio9q5vHVewr/cKGWYgvMzgOfiUQsb51KgH
         C4ulv7fqnTtJ8ZlVywR6Gnzfgp6xlEtRIIU6sUaHL5/mA0XxWim0Uq6oJqcGI5zrUrPl
         A/mF5x7c/fhN6i6xKCapWXtCBRDbfpvjsoAygKiO4TSpoyHFvulolsNCCqd7vWu1f0t3
         r0JA==
X-Forwarded-Encrypted: i=1; AL+hErHW8JZnX557eJ+Xo/D8st7Tk6NnKpGFm/talLjbnS1NdvS0iCSEuYSJLpyUSHnsdiQLdh6kgLjrBBLwJEw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8IC6NtAPbAkfOR0b2OOlZWJNw2gitUMB5vESNef2La/xzvnuPy
	mivnGPSEMHEzRRTOvW/gcWv72rmDDEjvZJemtEM9lfOv6rjzJfB3J4M6
X-Gm-Gg: AZFdTZeBLFbJxpXEw4h/uR7pWKlYPtlwpz+QtxWewkmZVhmQUvgsSWo3oJuiNeWOhY3
	mKzmUz2neA0RlK1pZ30bj1agsMR9KxCV1ss6/ZkA9kIb/83tsvUIRiPyKDX4kPqhjG7qn25cfsL
	ryfRRtoIMcg6dpEdscKyYhMkdtRG+nGYHzMxbGxWCFK7kRrYrceS2ll/FvphnJ4EIBtDGiNLX3u
	xugGHI4CGVYPuRCtDaLJX1nJPAX9lBiWu/2JfvrnKPst03DMYV8Vjw++kKRvZsFpiF+qqdb5/wR
	Ko+T4UUuUPX7oEFNDkd+RSUk6oAT3z+i+lqIbT5yWpFMthDacgwfoWmYa4rl96wDybP93F2GCp+
	nfvMHlt+gqvhnba6Fju+krom97xIZVpZZqpgSFkkWbbQ0LNfqjezaUsQXSUm0NtPJIoxwA9jLLv
	X91GBbvAsmJ6VYB/JDk28bqPsHetIh+iIXbF0fQOYDN3rSEr3vCizng9MT2Z9pUXNDt/JrkFLuI
	KDl806uGXPQ1NtAM9ZppBSxiTx2s9j8tVk1Q6QVnQnf5u6oVp8B/Dz4AWKBg+p5LqdOBVxhbZ7w
	rKiSIvXgOWRnMJi6ybzWLiV1Ab0PNoetZC5kTlP2nTYRThUQgor2f5GaKCRIwOfNWuh20Vt+vCL
	1FXcDPEhEBNhIvQOBi6ZhzKBn5ht05czoOr/ooT+VNIuX+GiSwvNYUwqU8CAsmwR8tKfi+HsK2Q
	==
X-Received: by 2002:a05:693c:88d4:20b0:386:a8de:2bfc with SMTP id 5a478bee46e88-386a8de2f67mr11085085eec.6.1795617922809;
        Wed, 25 Nov 2026 06:45:22 -0800 (PST)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm57121181eec.28.2026.11.25.06.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:45:22 -0800 (PST)
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
Subject: [PATCH net v9 0/2] genetlink: Reject joining multicast groups no family owns
Date: Wed, 25 Nov 2026 14:45:12 +0000
Message-Id: <20261125144514.2717012-1-anilkaushikwireless@gmail.com>
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

v9:
- In the selftest, find the initial network namespace with its fixed
  nsfs inode number, not by comparing with PID 1, which is in the same
  namespace as the test in a container (Sashiko).
- Unload drop_monitor at the end of the selftest, so that the next run
  does not skip that check (Sashiko).
- Patch 1 is unchanged. The Sashiko point on it in v8, a family
  unregistered during the join, is the window the commit message
  describes. The fix for it was patch 2 of v5, which was not accepted.

v8: https://lore.kernel.org/netdev/20261123155503.2497063-1-anilkaushikwireless@gmail.com/
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
 tools/testing/selftests/net/nl_genl_mcast.py | 128 +++++++++++++++++++
 6 files changed, 144 insertions(+), 1 deletion(-)
 create mode 100755 tools/testing/selftests/net/nl_genl_mcast.py


base-commit: 7b0c5f0c757cb61e28dc4128633877aaa8f6f9bd
-- 
2.25.1

