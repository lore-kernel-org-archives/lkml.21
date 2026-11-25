Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795590239;
	b=tJk1XXXAxttvNIR7OEgsxLOnmt/q5YHfhnwdLvMYOOchECk2u+5Y3JyyIF6fUcqwPUv5
	 j+sypWYGYnQNmeCiLTkC8xaTdNjxgepMQQwkEfNht0Cuw6pYEso5EFvh/+oX90x9eU87f
	 z0Vxi82AfEz3KwjFtCIb0o3zvGU6mwuM2eWw2hnK9LKwjLRfnU22Cq9Ci9S85EtYDXkG6
	 1JuY0k1n6XP2v4YURL7jkCIZVrBD7RXBEkN8bgFKV6GvxyjkqSvSrv+95NwHq8SjDkoaI
	 49oQQ1pN+gvjurrKJNuFlsQ6W3AiS8YIEIqvqVOvg9LUSfpTlnR/9i9IiLpqZtTN6Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795590239;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oACP7KwOi4wJuUdzN0kOj5H4T/uZOHxuyB1uiYqEcAU=;
	b=0+7P+D4EozLcAfBdrzziYTdDfwjO//qU9CfgepyTvDZJKPclPCqy0tx7SA3Llww48VQS
	 GqSOVc/vYGqXnykIClRPmpqHBgBmwb0S0Ti+lw+1ee5Ihdo/cs5ViLudkdh8rAgB0EOCB
	 +n4LwD6YaENLHB5RJjQX/7beTsXrnqweJLA5Oql1t5WNOXXCxquer+/0Wtxltf1sdKkNo
	 fc1tuwgh3GxJgWpkyPz4vEBJfNkrDSwtTCsrX1KvAoR/kmmLZWZ8GaNqP8qByCVlkPz4W
	 CcA3KxGYSJFqDR826FRrGV7Q6FmqQTpYGVWKEZtfz46RwFLUWXENMhAGrKWR+2m9s3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0uzasNhA;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40938606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:03:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40938606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0uzasNhA
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2f01f296937so41721895ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795590238; x=1796195038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oACP7KwOi4wJuUdzN0kOj5H4T/uZOHxuyB1uiYqEcAU=;
        b=0uzasNhAkBiX5LhlsXmhFVq6ektOu95bPqOSvE2huFfrGZ/6ZQ54FGBVgVKBFkbXFd
         J+N82c8f9n8ZMfB8xGUeA20jj+SR2TiX65wm3GXGTBu2sK8UXQR7y86J1cL4LtZYaiOu
         3/a0KsGac7kX8hWBptRlFUyXZroGjgkrHC8YZvucxejtAvZ2yiqIwW0iBcp7E0ZJVcvY
         z5Ig4fcLYbDrDlEc9LiD8XhGkM2K5cghGudNyaXpGHQEt82j3PEnH6nktwU5pzStMXqH
         RZdmHcNzckISfxef66kAPBzihoruylI9JiiYnnvuchBkiKWNO1GH4jb+LmFnIGznFLuK
         tTFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795590238; x=1796195038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oACP7KwOi4wJuUdzN0kOj5H4T/uZOHxuyB1uiYqEcAU=;
        b=jdFbDS37VJxf1Y7qgod2wPnI9/ySkz8gdgv0QdqGpgFuI4YXvizRSe93TGuYk82d2O
         oJ0CjwALvpHppbOZeiEET2QI0opVSN2LVKNgRxH2TI3bTmgbqVDSU/B38gJM/JZ4f0VA
         hAatNev3zd76RLlrtb8rATfRv3l7m/0/MD4hb0WU+3b4mirFFvZNN5YafLp2MbvnW9Mw
         1G8mkIHsoK+07nk2rNVOL7SxXN0UQ8lBs/Vy/r7pedkUZt0B+QDzuT/casfg0OHc0pFH
         Rmw/Df41rC5pyDEoyKUxS3Vvq1Hx/uMC0mIRypb5dFl0tAZDGcr6Z7Gj839NM4oBqyX0
         II8w==
X-Forwarded-Encrypted: i=1; AL+hErGz69eu0OrX8nGEVlJG+Tq53vYZYVqRysUJr8UAlufa768fgzhoJ57DNs0ty17ZR5lCM6zW5FrNao1pl9o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4tdR2HyOYpboi7YZ9SR0rkH1q5Um9UoiSeoCVTF/iofHVa10l
	F2x0vQdjT/aDFEV9OITwqIC0CDXMvq5taHfyYzefhZ9GOckBWLhPBswyY/kjhHki
X-Gm-Gg: AZFdTZds0S7YtJrGPAys47Aqx+s3cxjnzBt9CtWpTisQYreQGRWEZpeZEk7o3GY/8T0
	+T8xSBhsLogm/PDe64r5ieVZpPZtYAj5V+T5rybsT2wGT2TQzV6dK30skCgUloMJNw0AnR4LjA7
	Ws2KM6tWsooWj5fgkvepnqjHC1cdxn9dbsloDIIWCFnNH657POYNztkigyP57jZpnQTC1T0bfOu
	IHE6JPmAaQW31Pgw2uiJGO3Ff271YRs10JEkBRUYMkNZOULbQItBl/jwVSTs/MWvkeLb0mTHefs
	h7K8pKaciCx0mWKqzdmSqw1VuDn+mArZrZEa53hhLokGDE+Qon6WZjUFOM13wDonQm5ZEAI4Ux8
	ijZ0q2yl6jiq4MdSAO6z4OXD9/Zt2HhmSIf9MPkcXPjRZmzaVgsktKZrQnTLWPUZVVZZsMPKbUz
	ofK7qqvJcaDCy1nB/cg+wMCdmDIStIUoNNsfDaEjcsvYe5ccI26kGvtK3O8GgFyfn6vlg+g3xk1
	ST5UPmnhnv9rfmikwQr9+vMGrPCPrl+UjUMWljjFd9T2sLFuLEj/i4M2vXtt+QBoywI1jgVCCZL
	SCY0FqmZvlNBeID6nM35aDQh407C+dbpwmBOz35QVTHnhCwfbqyG3DKSyA03Rb88+iX6Htb97j4
	pwzZjnt94WuRVkEx9bAII0PGPYWgPZ0TR
X-Received: by 2002:a17:903:19cb:b0:2ef:f37c:722 with SMTP id d9443c01a7336-2f03f1cfac2mr177248305ad.17.1795590238501;
        Tue, 24 Nov 2026 23:03:58 -0800 (PST)
Received: from [127.0.0.1] ([180.166.22.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f14fc8csm79177425ad.74.2026.11.24.23.03.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Nov 2026 23:03:58 -0800 (PST)
From: Zhiqi Zhang <zhiqizhangg@gmail.com>
To: Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] tools: ynl: reject missing regen path argument
Date: Wed, 25 Nov 2026 15:03:54 +0800
Message-ID: <20261125070354.18200-1-zhiqizhangg@gmail.com>
X-Mailer: git-send-email 2.54.0
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

ynl-regen.sh expects -p to be followed by a path.  If -p is
passed without an argument, $2 is empty and shift 2 fails without
consuming $1.  The option parser then keeps looping on -p until
the caller kills the script.

I found the issue by manual code inspection and validated it with:

  timeout 2s bash tools/net/ynl/ynl-regen.sh -p

which used to time out with exit code 124.

Reject -p without an argument before shifting.  Also stop if the
selected path cannot be entered, so the script does not continue
from an unintended directory after a bad -p path.

GPT wrote the code change; I reviewed and tested it.

Tested with:

  timeout 2s bash tools/net/ynl/ynl-regen.sh -p
  timeout 2s bash tools/net/ynl/ynl-regen.sh -p \
    /definitely/not/a/kernel/tree
  bash -n tools/net/ynl/ynl-regen.sh
  scripts/checkpatch.pl --strict --file tools/net/ynl/ynl-regen.sh

Fixes: 25b5a2a1905f ("ynl: regenerate all headers")
Signed-off-by: Zhiqi Zhang <zhiqizhangg@gmail.com>
---
 tools/net/ynl/ynl-regen.sh | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/tools/net/ynl/ynl-regen.sh b/tools/net/ynl/ynl-regen.sh
index d9809276db..524fadb770 100755
--- a/tools/net/ynl/ynl-regen.sh
+++ b/tools/net/ynl/ynl-regen.sh
@@ -9,13 +9,20 @@ search=
 while [ ! -z "$1" ]; do
   case "$1" in
     -f ) force=yes; shift ;;
-    -p ) search=$2; shift 2 ;;
+    -p )
+      if [ $# -lt 2 ]; then
+        echo "Option -p requires a path" >&2
+        exit 1
+      fi
+      search=$2
+      shift 2
+      ;;
     * )  echo "Unrecognized option '$1'"; exit 1 ;;
   esac
 done
 
 KDIR=$(dirname $(dirname $(dirname $(dirname $(realpath $0)))))
-pushd ${search:-$KDIR} >>/dev/null
+pushd "${search:-$KDIR}" >>/dev/null || exit 1
 
 files=$(git grep --files-with-matches '^/\* YNL-GEN \(kernel\|uapi\|user\)')
 for f in $files; do

base-commit: 7ccb044c27720d48175577080b851f047ddcfd1c
-- 
2.54.0 (Apple Git-157)


