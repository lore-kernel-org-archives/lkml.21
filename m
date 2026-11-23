Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795449324;
	b=f+aBURDdeDBp9M1V7SEVgxdIt2nZ14EPZIeJ3sIeO/ADPQMEBI6F9ik8q6zLfpNYsnja
	 g/Cxv2TKXbFKfl7O6C6FkFay5BTgD/AJkQCjZFjfN+CmYEDbX2n8kQ5wgY79PKCoEZs7B
	 Ehf+tp297HUMUBR1O/xBLWUO5rYelrFTjrw5WHu/F0YM2qOnicHfxK5ALc7+lAo2bHbGT
	 Xvw0DVX239M/J5vfx7t7UWxM8ahfFV47zomRnPRth04Yb2drpK1ucTviRIJCC3U+KqAq/
	 PBlrraGHN8rBTgbIpagZfpOkorIX06s2arh28F9dd+dAxGyg87b6YKK+2dDzUtyLLew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449324;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tvgo8UOeGR3ceD1ujQM14AUV662Pec2r3lgrSGrnkwU=;
	b=CzgBnUoJGp39nwsTAdaD7boDUzF3Ep/e2D5dDvtAPKm438jfyvIrbxMHc2bqg6UDwC6K
	 R2ZWkVWnf4NDzdbMWyibxnhhZzJ3ZhLStw8zkN6gTt9RC5aLqahIlJ7G4uTnN8YthgKra
	 kIrgEiTv+0ygo593p5bi6IdBmhm8PXeg/8YoFtCYi1k2zUjK2OQLFuiEIJG1zSfOraw10
	 +CYA6OK4jybAJyqi65RDSAmf8P7PGjSlp3A9W3BW7qDpDxvuSS/AO2/Mp6NG10B24BibG
	 5+dHSHDjjX0cRUJ/PdSlqy90Nn+Xk7lhh0aanmJebCdHpnqerFNDvQ97nXn3TsXtK/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LkIsuT2y;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF4F606A331
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:55:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEF4F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LkIsuT2y
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-380c28f9e35so4572935eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795449323; x=1796054123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tvgo8UOeGR3ceD1ujQM14AUV662Pec2r3lgrSGrnkwU=;
        b=LkIsuT2yOR+IXm0ZQBfc2/Lid/L3sxGAL+rGlx1baRLc+zQ6e6kcSQDDdVg/533Qpa
         x3Mg+nJObzSsZ+fdtHifBu8C5Djl7eWc9dLmvzHriCa46CUE5IlgsnHOXI4DYlFbZjeM
         oZQkuz1X1QNE65NHu2OMiNlg/afD6ViJV+Rjh1eqKA+7LrWCF5kLlRr5fWBNTcyZktb4
         NuSHlnWuAlaIheWzkFhQkry1UGFoPUMGQfDbg0OdS2Y9pIWTQroWwVog47EKGuTeOmfJ
         2B9fAT1ZN42eB9NGE4H9cigA9wswXOGzkyaZAIYmsXl9LWsVf59IU/+Xb/jqrjz16Ryz
         sDIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795449323; x=1796054123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tvgo8UOeGR3ceD1ujQM14AUV662Pec2r3lgrSGrnkwU=;
        b=EYV44LvlSism9ed8OJG8vmpBgLtwGqv/4zi8fARGVR8j/TBjJvWiGOIxuGNnml6OUD
         Jtm6aUfsG80xJ+Eq1nP2s8tQqVM/EzjtD21EH7ynP9pJa+HffWtSjDOuK9KZ/P5Z9Yu2
         hk4G9rqoeUsPIvt7NbHOteN/QlSK0y/b1dQGGYiuFTTD3Pz9kPQOguYht6anCYpFp+WA
         VVlFJSIueYtW1n0XjX/0NRaO7kbegMifjx52WxvvO2RYF6DQr3cKjmVhLxcAPc4wc2KU
         sfa10dX1BjB997ZUcoqEBtcEKgtG9LZFnYuT8XXK2ajbuiR2+fQiQ2i68RFNeOLeyAeS
         vCcQ==
X-Forwarded-Encrypted: i=1; AL+hErHuhfAHstZXN1d6zmaN6KRPQNIRD+5TyTWVDHtW/4IZ32pqRT6OjvnsJtAbYgjqeB1EcdU+y+ri3o+bSGg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cgCYrVq5l3EyWRC5sYTbedQAkYWIHYhEtJxp0inmhmQRY6woB
	G50XDgltJMFp5/F3WK5G3v6wJGd0AceiadoLv+5TXgUKZ1popqXjw5nV
X-Gm-Gg: AZFdTZc1zSpddGJlFLlyvRl++NFFv8jmv1sfoITV214gEjkgU5ZI1s70D86qMsrNIYe
	uOtF29oVvGAAmoqGmZT37WI6RT+RXayCG7KsG1xt/iQyzoax/RsXwJV1otkMLGVixeWRdlCaH4f
	y8hiyQQ+ue5T8CqcrSEaEO+zYblrtwHy18Y3UB98E+WNLoGoooWKaaKVGIXWfka97urvrAJYPy7
	yRAJfJlHFZMeor11kjmwFwTuNQVwJj1ZU3kO+ZlyNVSny8+aig4VaWNw3/wWeW/Z5z3FKedolIC
	4x42MbpkEOLk5qKSBlXEvijdDz5dB5KYd9eou1c/jH9GlZwnsLS9OXxALLziu9fu9FCqjt1B4mq
	uw5hdJY6OfdoJUoOWhzTBYrBQIhIp6qHYYg46pOSQQR3+SAnEIrgDrs9YyduJsQn7ohsSZmsXI2
	L5upiGbuiFUEjn7PCGCoqsZWeFoy/norAzOrIHo4Id5PDaYqwQO7UvsgMkqwJ7OT+aq5oPvr7Fq
	a7crfzNoXLcDwseaYzj/amo7SPwXp9qQyyw1jWLBqtjUQWkbhzVfN6SELk1qf6JLPZbBneZ3SQ8
	L2ygSPQhfoWA+2QD/13vk5M9fYMalTvIbyAH1L4np50wE9Y3f/1o4B6r3nQa4grusWJ18o3UQ7Z
	TwoCbzmf27l04By11EMjCu/ZQhp/K+PGfDSWDd6gtx39RU6wy422Nhh+SvDdidA8fgvNK7/5arO
	s=
X-Received: by 2002:a05:693c:88d5:10b0:386:9e9c:867 with SMTP id 5a478bee46e88-3869e9c2df2mr7555478eec.10.1795449322783;
        Mon, 23 Nov 2026 07:55:22 -0800 (PST)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm13723517eec.18.2026.11.23.07.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:55:22 -0800 (PST)
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
Subject: [PATCH net v8 2/2] selftests: net: test joining genetlink groups no family owns
Date: Mon, 23 Nov 2026 15:55:03 +0000
Message-Id: <20261123155503.2497063-3-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261123155503.2497063-1-anilkaushikwireless@gmail.com>
References: <20261123155503.2497063-1-anilkaushikwireless@gmail.com>
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

Check that a Generic Netlink group ID no family owns cannot be joined:

- setsockopt(NETLINK_ADD_MEMBERSHIP) on a free ID fails with ENOENT,
  and still works on an owned group.
- bind() with a mask of free IDs succeeds and joins nothing. With an
  owned group in the mask, it joins only that group.
- A socket bound to the free IDs is not a member of the NET_DM groups
  after drop_monitor is loaded. Skipped when NET_DM is already
  registered or drop_monitor is not available.

The free IDs are found with a family dump, which only lists the families
of the current network namespace, so these checks are skipped outside
the initial one.

Suggested-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Signed-off-by: Anil Kaushik <anilkaushikwireless@gmail.com>
---
 tools/testing/selftests/net/Makefile         |   1 +
 tools/testing/selftests/net/nl_genl_mcast.py | 127 +++++++++++++++++++
 2 files changed, 128 insertions(+)
 create mode 100755 tools/testing/selftests/net/nl_genl_mcast.py

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index baea3e7f0f8f..875ce0443814 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -74,6 +74,7 @@ TEST_PROGS := \
 	netns-name.sh \
 	netns-sysctl.sh \
 	nk_qlease.py \
+	nl_genl_mcast.py \
 	nl_netdev.py \
 	nl_nlctrl.py \
 	nsh_gso.sh \
diff --git a/tools/testing/selftests/net/nl_genl_mcast.py b/tools/testing/selftests/net/nl_genl_mcast.py
new file mode 100755
index 000000000000..4e86a5556b62
--- /dev/null
+++ b/tools/testing/selftests/net/nl_genl_mcast.py
@@ -0,0 +1,127 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+"""
+Tests for joining Generic Netlink multicast groups that no family owns.
+"""
+
+import os
+import socket
+import struct
+
+from lib.py import ksft_run, ksft_exit, ksft_eq, ksft_raises
+from lib.py import KsftSkipEx, NlctrlFamily, NlError
+
+NETLINK_GENERIC = 16
+SOL_NETLINK = 270
+NETLINK_ADD_MEMBERSHIP = 1
+NETLINK_LIST_MEMBERSHIPS = 9
+
+
+def _groups(fam):
+    """Return the multicast groups of a family as {name: id}."""
+    return {g['name']: g['id']
+            for grp in fam.get('mcast-groups', []) for g in grp.values()}
+
+
+def _free_ids(ctrl):
+    """Return the IDs in 1..32 that no family owns."""
+    # Outside init_net, the dump skips the families that are not netnsok,
+    # but their groups are still owned.
+    try:
+        netns = os.stat('/proc/self/ns/net').st_ino
+        init_netns = os.stat('/proc/1/ns/net').st_ino
+    except OSError as e:
+        raise KsftSkipEx("cannot check the network namespace") from e
+    if netns != init_netns:
+        raise KsftSkipEx("not in the initial network namespace")
+
+    owned = set()
+    for fam in ctrl.getfamily({}, dump=True):
+        owned.update(_groups(fam).values())
+    free = [gid for gid in range(1, 33) if gid not in owned]
+    if not free:
+        raise KsftSkipEx("no free group ID in 1..32")
+    return free
+
+
+def _sock():
+    return socket.socket(socket.AF_NETLINK, socket.SOCK_RAW, NETLINK_GENERIC)
+
+
+def _members(sk):
+    buf = sk.getsockopt(SOL_NETLINK, NETLINK_LIST_MEMBERSHIPS, 64)
+    # An array of u32 in host byte order
+    words = struct.unpack(f'={len(buf) // 4}I', buf)
+    return sum(w << (32 * i) for i, w in enumerate(words))
+
+
+def _bit(gid):
+    return 1 << (gid - 1)
+
+
+def _notify_id(ctrl):
+    return _groups(ctrl.getfamily({'family-name': 'nlctrl'}))['notify']
+
+
+def join_free(ctrl) -> None:
+    """setsockopt() on an ID no family owns fails with ENOENT."""
+    with _sock() as sk:
+        sk.bind((0, 0))
+        for gid in _free_ids(ctrl):
+            # ENOENT
+            with ksft_raises(FileNotFoundError):
+                sk.setsockopt(SOL_NETLINK, NETLINK_ADD_MEMBERSHIP, gid)
+
+        notify = _notify_id(ctrl)
+        sk.setsockopt(SOL_NETLINK, NETLINK_ADD_MEMBERSHIP, notify)
+        ksft_eq(_members(sk), _bit(notify))
+
+
+def bind_mask(ctrl) -> None:
+    """bind() skips the IDs no family owns and joins the others."""
+    free = sum(_bit(gid) for gid in _free_ids(ctrl))
+    notify = _notify_id(ctrl)
+
+    with _sock() as sk:
+        sk.bind((0, free))
+        ksft_eq(_members(sk), 0)
+
+    with _sock() as sk:
+        sk.bind((0, free | _bit(notify)))
+        ksft_eq(_members(sk), _bit(notify))
+
+
+def bind_before_family(ctrl) -> None:
+    """A free ID joined with bind() stays unjoined when a family takes it."""
+    names = [fam['family-name'] for fam in ctrl.getfamily({}, dump=True)]
+    if 'NET_DM' in names:
+        raise KsftSkipEx("NET_DM is already registered")
+
+    free = _free_ids(ctrl)
+    with _sock() as sk:
+        sk.bind((0, sum(_bit(gid) for gid in free)))
+
+        # Looking up the family loads drop_monitor.
+        try:
+            ids = _groups(ctrl.getfamily({'family-name': 'NET_DM'}))
+        except NlError as e:
+            raise KsftSkipEx("drop_monitor is not available") from e
+
+        if not any(gid in free for gid in ids.values()):
+            raise KsftSkipEx("NET_DM got no group ID that was free")
+
+        for name, gid in ids.items():
+            ksft_eq(_members(sk) & _bit(gid), 0,
+                    comment=f"member of NET_DM {name}")
+
+
+def main() -> None:
+    """ Ksft boiler plate main """
+    ctrl = NlctrlFamily()
+    ksft_run([join_free, bind_mask, bind_before_family], args=(ctrl, ))
+    ksft_exit()
+
+
+if __name__ == "__main__":
+    main()
-- 
2.25.1

