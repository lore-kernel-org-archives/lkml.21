Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795660480;
	b=b5yZ/EY4UWG3ufVV/Q24jgyZTfhmQSaYh2SCtxs1J3n7dIW0m1d3ICFtRktxKJKEY3rU
	 ezirbyKzrxYfY/pbSJlLZRT+rsQgzAZmG8r8x2ikO22d5GiiWqa0ZfhGv/wSj0XOEeJvx
	 Br+cPXPaBcpqPA+bjRa40TBhA6eEIq7OtykSgPuq6CNZ6+D89MgKvS6OdIiNbDKgVmitA
	 cpdJI2o6CjT/vGxPP4IdKMdg2+nOmjlkVtVnZjrgnpbjr9jMm9Otmwmw6RP4NIIpkzKhw
	 Cp7q4Naw7nj0BjgipcmMvB/l4F/omXUGDsQ2oQOIp7JmS5eijmOwR5QNiUKlOBwl/dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795660480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=x/ILrJ+/NMYTFTFp5J74uQeEtDJj7OVnJ5vnxO7aL9Q=;
	b=crMW7EZ3RSHfhdJQDmVesZoi+CTEXzqSp5s/N/cKd8Ql9dURXbK9b0OMxLt3tR4fnGX6
	 uBgybLLMUJQbJdwEL0NSZTSgyKbabhSTeJdTGhcAGcfKYdQ/6BtCGNRswMho38dZe45WN
	 6+RUkvtbo3ltoxa24lyciyenOqYpEGW7BUItW+C4T59appq8QUGcC9MoHJ9YALSuZrznT
	 XKBP970OsgdaQKEZdlIownCdXgfqoycuJ6y3LqPc28oSAAEwZdvOBSEIKRqaMUEhpgQV+
	 k6EEuxY8MKFy+lhCjHbO2LKkWoRpDI4u31jO8vlROaTunLo+MTtepGM7guwJoIedpew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ctxJ8ZzC;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2767F606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:34:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2767F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ctxJ8ZzC
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-386e226acaaso10165eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795660479; x=1796265279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x/ILrJ+/NMYTFTFp5J74uQeEtDJj7OVnJ5vnxO7aL9Q=;
        b=ctxJ8ZzCb5J+nwhRb4lb2Eeuu+v3J86bGNTKlzTAQCD5zCdQpV498cQ3u7a/ujYruM
         M2MQxJyBpyE8l9Xl+OcLQ/I6bBP9rRGmVjKBXXipNlXGmXNdK/Yky/hK/3CWJKybyvub
         WpTSmK/GT8ZCMYsgiEF3voNroNE4W64F/ReheYKtIvfLLa0F6+/RAExTXhkrssOknuCY
         L7hZLCtNAHnCBUwGBOvpk9JNr18DTGfUyiCEBLFMAndorG8mn7egM/K1l7c4vLh3g8aa
         KIzYtddpF1mOxglxBVB+2bwPSHSNs0s3LMUfoc+mpfW9rdBCy/5q1pce0j1xMecC3T1H
         z1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795660479; x=1796265279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x/ILrJ+/NMYTFTFp5J74uQeEtDJj7OVnJ5vnxO7aL9Q=;
        b=lKU2BnhCoVKslUyzZp/kBxeaKKypQYv3BzjIm5m/aw0ceuB242RlwqAEYbLkJ5ICms
         2V9IRuDnHZqipGTwSixGiFGGkrFK812d555ARcIXPqV5ZQr+VLeoIPjhzuug0QmipnTR
         VvaEMFZHvi5ZA0m8YcfwhXAwkmz69eKkC/9I100qcdvMJRWD0Ar80Ey0v7sArb76JQyt
         M8MXBl7LNMtt4MmLiarxYdD1xjIW79b6qqjsFn+kA/OxL2QakokNV4HQErwXl9u0wH58
         /ANaowsoNA4lQY3CYZK4UKAmjXcL/fwAyXQ9mBBloZn45kMNiuFzFfNcL+AbLYmYfLna
         e4iQ==
X-Gm-Message-State: APuU4Z9DTwq2zt3kDjamkg+piy/ia7gBlSbk3bZtMe2dm6ciPEvwgRoq
	dI2OQm29oib3P9PZ6AmHzRMVVIuM97+YbEMNxwZFyWjiZLoVHOWbKzPHS7K9D5sUaqnVSCUk
X-Gm-Gg: AZFdTZdt//k70caKN2SqIEv2u9ePWvPy9OcgRJ1cw14hKEWO6pv9oN4KJ2y1RUrWRPs
	bmUZuzlx0NEvRXbxAHFqbT/FPRc4NqFX4dWGH6Gg6IDmkTod92zX2qqECk9ns9kxoLRJMvhLTWR
	onE65J3SW4PxL1eXVuiRTZEFQIDoo8K0XV4Fm+5RPYZ4iZMkuMrjvGdWq4Mg76LkP/o5avidfg3
	NdeZvVJtRhRejhUG+xf7WGeA1v2ZdlS9+IGZ8v8kBWhOgYn3Ui9xMOdrwUXBQI67nZnn8jcdSAN
	KuVfDv+w5jVpTVIMoDc99Kkwo7oUcDsZe+QDy5Aj+cE1Ypsk5iG1FNVWvLISH1ISoTG7V6pXAAq
	u8zBhFKT4099/ZqZXQZg84C0phTk6++/14WmibJuaZ4AhyhUHacOUtOuZkmQw1c8efXbsuNXUoT
	Bsx+BiGrxslgrtm3hsqDQ6yaTHWrAsJfUrD6D3LErPi7FWv9VUyCUelVD+CrQ7zEMGd+LjuZQK8
	W6FvA2QFhKGkXusrYLgGW+dB7J5hAUCxc14Ey2nvmIRcMwVKqocdL3rd7wC1j2JPXfG6f1dPSOc
	/WeuNNO9EmmmDe2aaQMCkn0WOXOs3e1Aj5+K4w9gIjM0MgsLTgdYaMjYIYOjrlL8By80K5EypiB
	TWWHnd0Xloa6WhnBncsRmGebzEOmc63Mye8r3m7yBe1ED79fl4WETAJkBJCl+dq6rljfeQm0=
X-Received: by 2002:a05:701b:4281:20b0:14d:c7ae:85dd with SMTP id a92af1059eb24-1b55686523bmr20656315c88.7.1795660479079;
        Wed, 25 Nov 2026 18:34:39 -0800 (PST)
Received: from localhost (ec2-43-203-195-82.ap-northeast-2.compute.amazonaws.com. [43.203.195.82])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm44070633c88.2.2026.11.25.18.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 18:34:38 -0800 (PST)
From: jianyungao89@gmail.com
To: linux-kernel@vger.kernel.org
Cc: Jianyun Gao <jianyungao89@gmail.com>,
	Carlos Maiolino <cem@kernel.org>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Eric Sandeen <sandeen@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Yuzuki Ishiyama <ishiyama@hpc.is.uec.ac.jp>,
	Jinliang Zheng <alexjlzheng@tencent.com>,
	Dave Chinner <dchinner@redhat.com>,
	linux-xfs@vger.kernel.org (open list:XFS FILESYSTEM)
Subject: [PATCH] xfs: fix wrong lookup direction in xfs_refcount_lookup_eq tracepoint
Date: Thu, 26 Nov 2026 10:34:01 +0800
Message-Id: <20261126023419.5727-1-jianyungao89@gmail.com>
X-Mailer: git-send-email 2.34.1
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

From: Jianyun Gao <jianyungao89@gmail.com>

The trace_xfs_refcount_lookup() call in xfs_refcount_lookup_eq() passes
XFS_LOOKUP_LE. But the actual btree lookup below uses XFS_LOOKUP_EQ,
so the trace record reports a mismatched lookup direction and misleads
debugging.

Fixes: 08daa3ccf541b8 ("xfs: add repair helpers for the reference count btree")
Signed-off-by: Jianyun Gao <jianyungao89@gmail.com>
---
 fs/xfs/libxfs/xfs_refcount.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/xfs/libxfs/xfs_refcount.c b/fs/xfs/libxfs/xfs_refcount.c
index 75e469576a8b..6a15a1afed1a 100644
--- a/fs/xfs/libxfs/xfs_refcount.c
+++ b/fs/xfs/libxfs/xfs_refcount.c
@@ -96,7 +96,7 @@ xfs_refcount_lookup_eq(
 {
 	trace_xfs_refcount_lookup(cur,
 			xfs_refcount_encode_startblock(bno, domain),
-			XFS_LOOKUP_LE);
+			XFS_LOOKUP_EQ);
 	cur->bc_rec.rc.rc_startblock = bno;
 	cur->bc_rec.rc.rc_blockcount = 0;
 	cur->bc_rec.rc.rc_domain = domain;
-- 
2.34.1

