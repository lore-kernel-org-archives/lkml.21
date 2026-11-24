Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795504777;
	b=Iqeg0GBsqdssauJ3yr9MroZORAtbJN25m4oY0Eea5FKX8HLupWtOK2/QzB2FF68U+I4t
	 zNsxuYMqAQPsjfznz+2KhLtzcsuWw0+CZYvWVaYi6fVQGL8aIjKA5vKORclkQwSNrLG9t
	 kkevpAxBo3jSbtTqer5ypB4spP8KuXYzirducLmfUbEehHaIUqX7n6yLVXmbl85r8M1RP
	 8qs824ZYB3c91vsRV6SY2SGQrv14doyj5DdCeRFcsXlfgQI+OfQyZN9hJ6f3runpgUVNh
	 mRJZ5E0w21cBpYun5n4BlE7yMN227nu7CKIjlfhDixUoCeHhI0u4CTexJ8gw1jLP3lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795504777;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=psyQ3R+IPgp+Vrzba+etQGrWT4agfKgZFhLKLz+GJT8=;
	b=QVAxOoLpOOWESF/MlW3X0FD5mTSVDW4Y1cMRZ5LS+BpfgyiMMFJeQHVolNmsu2m/XD6u
	 aqJmhNmVaG9NHBQUaycIxPlySYcUj9CkpXeT0DVJzACKoFxMeIk3Ck1R8HptlSK+lCTTw
	 rVXKkbD3bSsMynPwoxJqIwzumez9TVya+cgtWD58FBHMZAqGiar6Nv4R4UFZP49vWqp7q
	 knL6qgl/eSu16pg7Ja7CYIPz3sVLUoV4IdRBCnurtEors27JQJwgguHLt0Iz+XoA2cvva
	 AeRc3uZQjp/V2sSFoovYZzi2dG/22vpztT18aJsNzs8HcxnHe4SSYiattvJEPpNIFZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jb33G8mO;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F12606A33C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:19:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0F12606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jb33G8mO
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8b29b83fdf1so2113548b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795504776; x=1796109576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=psyQ3R+IPgp+Vrzba+etQGrWT4agfKgZFhLKLz+GJT8=;
        b=jb33G8mOS/Hi1jWlbaudR+Y8v/b7kjNRymBbnp45JRiKAkM+lr1QSILrSFem736iC2
         AfvHjuItnI3tl4xVMogeehGLzwOMrB2+yFoU13bZ3qGKTRZR9JaIU8msDmLWruizzj8j
         OSk6LEihZORe7s9OQMIZGBkXVm+kEF6KUqbfzlc4/pxTv404AitSpyj5YzzJEcHIsezr
         /1DLOdMmJ6e9rD9GDj/ELR4XWfVfJG6AjbqkDpEa26i/A1g0xYDL07lr38ai6F0IKdp5
         KKtU89PJzK9LVmwEICshchHb2kl73xBJ3h7Hg5CleDSX8DZLiDYtmfUHIYsFky5Lfs90
         2YWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795504776; x=1796109576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=psyQ3R+IPgp+Vrzba+etQGrWT4agfKgZFhLKLz+GJT8=;
        b=bdr/vUWN1725Q/p05Muava4pK/Sx8Jjif0quwFvPAMxZJzat1P8PiCjxofnoTh2gQF
         3b+zLMd1GETvn6YJM+o8Niml1dVkQEkrYR8E/5ozbx8PYtoImpfvNFhON9RHMmjMj4vy
         pP92SJCDjMOdfImYAaE3H8r/GW2S5pM3T2B3lxMCgHSDAIKqq2b5FWVx4bCvEkQNpvAN
         X0h4x+mq+d0N8u3IGkptEc98DIljfM5K+sLgkt9r45AuPFAcdXiUhTKwoKX7RtgvUVmO
         5evW1lbI0qX6Z7XjtlsY1pZ/HiSPGAiJSDemzPX/ijlhjIohWHBXXsfwrJ6/WnMOqDvL
         0W9g==
X-Forwarded-Encrypted: i=1; AL+hErGRIQg/yekqdFz69/m9M6ryCPXAT09hHLmuPp2R+bJ33lxtiJW96maDiPPTDM9uGxywBGIBv9aaZTm+M3s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tAz2fjpFQi4lDOlzpqelPBnA5hG3xSYxiA1PHVfVq3QZLphUV
	ZwNdQFyhE6vCyQTfoHqODslmPz83ksKHm/b0XV3vmyxAeQGnPnA8AH10
X-Gm-Gg: AZFdTZd0WWqrQv0xo7VjQ4XsxBvyQ9dNaewb++XxiKrSUVPubZB5c6nuOffnx9fQH2Z
	Lff/A+xFBWkviZqy1XOSaUyJLKmKLpENar4heF08okoJNZ1DE2CtlO2YY8AOmmcEoBNraFA+3tq
	40Zll3wpn66/d5XZROIqBleLSUKZSV4yL3bIfl7rGhSulTwTxxnHPPaiu/2oZLAKo/5kFSz0lVb
	MIGW819BV2k9c+cOS3il5wy3xqs0oCpGPeCMA5fMU8zAa2KmmGagX04dnadtbUlXY+k+KPkFjhe
	XS7W+6OV0xegx6j/EmJujaSXPM8jAQ5/b49X7dcccWsPBQTXKeKd3GMoUSKn6LF+pHNJWPVUnM1
	qam2MDx72H/V5fOCoRSTcA5Qbv/VlSp7GG+rCPyYHwZ0sOKjK5Lz/g2mBUz1c5FR+qXwLtADRTC
	59IMpv7vi6Groco5Ed78JVnwGtHEan8rUDx+7eSBKrJRaHoEVP83HPg8Z57gsmdEDzGFGHz3fjO
	YVSEOq+vlDfZHQLosQM528uMXMkIWyU7oB6kQRDgwwEvuXOe0oPdjwUpYQu/SpMp6uFvDKNhBM0
	+jqQQkhQcYs5K4mzDujhqv+Cq+2tRnNPf+SXZLP++UIoyMqxkjiW5ECoURslBnpQN2rVrzGqJVk
	j3JhmLMCS+1lom/8IL8g=
X-Received: by 2002:a05:6372:a748:b0:3e1:885f:b4ab with SMTP id adf61e73a8af0-4014a27e905mr10620093637.8.1795504776021;
        Mon, 23 Nov 2026 23:19:36 -0800 (PST)
Received: from LDYT9Q2G2M.pvgl.sap.corp ([2a09:bac5:cad3:119::1c:2e7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde7f91c6f5sm4425486a12.27.2026.11.23.23.19.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 23:19:35 -0800 (PST)
From: Zhiqi Zhang <zhiqizhangg@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhiqi Zhang <zhiqizhangg@gmail.com>
Subject: [PATCH] selftests: netfilter: fix missing echo in nft_nat_zones.sh
Date: Tue, 24 Nov 2026 15:19:26 +0800
Message-ID: <20261124071926.8818-1-zhiqizhangg@gmail.com>
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

The ping failure path tries to execute the failure message as a command
because the echo command is missing. This reports a confusing "command not
found" error and returns 127 from that command instead of printing the
intended diagnostic.

Add the missing echo so the ping failure is reported consistently with the
other failure paths in the script.

I found this bug manually. OpenAI Codex generated the one-line code
change. I wrote the reproducer/test case, reviewed the generated change,
and tested the patch.

Fixes: d6905f088d2b ("selftests: netfilter: nft_nat_zones.sh: shellcheck cleanups")
Signed-off-by: Zhiqi Zhang <zhiqizhangg@gmail.com>
---
 tools/testing/selftests/net/netfilter/nft_nat_zones.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/netfilter/nft_nat_zones.sh b/tools/testing/selftests/net/netfilter/nft_nat_zones.sh
index d935c967dd..f15bfd3373 100755
--- a/tools/testing/selftests/net/netfilter/nft_nat_zones.sh
+++ b/tools/testing/selftests/net/netfilter/nft_nat_zones.sh
@@ -171,7 +171,7 @@ done
 
 wait || ret=1
 
-[ "$ret" -ne 0 ] && "FAIL: Ping failure from $cl" 1>&2
+[ "$ret" -ne 0 ] && echo "FAIL: Ping failure from $cl" 1>&2
 
 for i in $(seq 1 "$maxclients"); do
    if ! ip netns exec "$gw" nft get element inet raw inicmp "{ 10.1.0.3 . \"veth$i\" . 10.3.0.99 }" | grep -q "{ 10.1.0.3 . \"veth$i\" . 10.3.0.99 counter packets 3 bytes 252 }"; then
-- 
2.54.0 (Apple Git-157)

