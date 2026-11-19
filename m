Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106681;
	b=eER8yLpqIxWHNHQiLUgJ5bdceFDDifgcT2+PJ/s49Gr6h4hU/GTm8VjV7TABOX1ZqXUg
	 cjrNnhcmKh0/l9JrI6JFLXV1dkRHQUqGkl4AMw854n7l9bdpOQLLkjt86fl1iwZzX+sZu
	 I+WeohMse3y9x1b7XSBZPdSSRw2/ak1M4OP7Di1AP8Ls35Liqq4sYWRc4j/bwTZ2428WT
	 7wj1HqM6DE+ggbLNutCs5QLUXONcKgCIuRtBe8Om+lfyU709in+Zby1WwS0wHwdgr9hFQ
	 pf64wCDO86a9skyw5uqDMGBqgel1k2lmv1KnCxUSy8h2tgEc+hY5+wATbZph0N7l84Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Q+X+PnXRxbIpUUxSS6LCpA/7gQ5HQHgpeF9zf6tH5/I=;
	b=dHlc9gCJCn2SoLaN1T7LBo1LjPhctJWMJhuQ4d7fCToAaMl0GFKoDtXwRGyMAXB7BB+R
	 H03ftKUFEfnLuvN8uv++3+OO8pISfSygmHaTn9AFSutBwYm3HHqP+/7bP4qDNhNVcqxvu
	 p4OrrOfq59PW78OpU7wu7QNTds1TeoBZ0DQ0XwWzx2iQesDF3LzvE3AILDRVYgPkF1dph
	 A2adAPgTE3qrEaBlM/AAydZXxIBq1oxafURr5F/G0hFvXceb13tza16tE0iyQsS5uD5wb
	 BFggRXHmxUfl0yKTgYbhtPzynJq4KdugRp7GA0oe3ScZZQxm7NUaoTxbPVtIMeXLcYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RQ414flI;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5DF606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D5DF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RQ414flI
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8b5e5e64494so2938b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795106680; x=1795711480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q+X+PnXRxbIpUUxSS6LCpA/7gQ5HQHgpeF9zf6tH5/I=;
        b=RQ414flIVmuB8vvRnrunHccGzUqdPpcgcwYaLUZ6H21cZDBg7PY2aTLFXnBMsHoMRd
         38tQFlsbfGyeJFasCda8TvHb5k5Yvi/eVOjKqNM7qQNDa3hXTfeZ7txKRPwllccKZAZ+
         FRFGP4cpEees7vLq/ZIQ4DL6p/nvsxpC65XPvX3HaXYsMYWCy3mL3yO4hfJ++wq26riK
         PzQr3/Q85tHXTcKb0MXJryCgzxEQHlAxs4Uy46E9FmZeBuO0pNGI/D0lRYRDvGiQ4L7p
         7RTF/IwJvehvOpit9VUNGo34pB9FwZ8tpKR6VsVGdtr5JL3ZJGnNQx8rLlSW/gNIZGh/
         HHiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795106680; x=1795711480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q+X+PnXRxbIpUUxSS6LCpA/7gQ5HQHgpeF9zf6tH5/I=;
        b=Mav1Z8KWrRCHtz4mj7bptuAHakkCRpxU8KoZcnhGUDQ130+ZXW8i+HUcmVPeQ0AVKM
         1l5sI50DAGj874PWFGJcI7XuGdSHvBMfdCCxLfdzQ/f1LheAnUBI04CxyGxkY9MdtVMH
         7cq4JkRYk8LZms8QZLX3CSf+9ndWZQs/ZMqi0tDq/al9a5NaNVkFgSCo9JsHefJUwsZa
         vSigdfau6+jMBII8WK91wwecwf4yugvpwLJl8k2q8DTAq3qucIIUNivBinIK0i/+YW9M
         /LlaNR4q6HEiaI6q6FycpxOWidw4TiY5McgZ0g6AnGYuOv9AM2D/z58ir52e37oDCmFm
         cn3w==
X-Forwarded-Encrypted: i=1; AL+hErGpxH1Ryp1DRMA0tzbVgfdjZdCv8n8gyspMvlvJNeBrh3nPQVSyZ3MsB1p01FbbtsRDRWslKsPQToR4TsU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+etC1Ag8lX7ni7NltyBfdjj9NKzq8xPeP7d0O3UXzLSLkPfZWd
	uemcIc0L+0y8DPqP6gUo9dB20IucblELaINK82pCtpmJBhAvzaFlQxKj
X-Gm-Gg: AYBFou2sqyA4CM66VikKaimidcGVUOpY9AOnZuMYWKM4y5vGd+ZZR9efifEm0Cl3ohO
	iKpIkyCqmpSQUuXmDZLcPp0qDpD2qWMxOC0EKm6IvbY1ngYK6dl4k/G5uthXzmcplDerG8rZJq4
	LQWWLmfmqGDMcS34C8oMbtYVdhq3mLil7yDpGJBWSrBowsuugiw1Uj9pg/Twz/H8MCPXXiECmyd
	XfStpgdHeaDh+ohknAs9EmHdYkirbErXwV8i3tMD90PtOuiyhFwV7tqmylQv08U14PeP2YJG2zo
	V22JgYPn5dsUFe7vokR8kXD3YgaNS9u7N0gsPSFSNE2baQTfpDpszJBh70Rrh9gvr26iteV+F3/
	QqgSftphdSIvDPFEqdN3zqHnSBWUSXTUzkj6hVNvwdVqmlyK/GVzkKMmD+/qOvCMXTvTR5Zgp9B
	wlqhqrAvevGOPHY9zWUqOdiN8inU+zVFW1O4S7toQuyy8+AvBjckpMOXx3Io5PS9JDQexrqskNC
	m358mcGe9VfkxDd0jlcIuDSQC7hTE/3KAQiQKrQTZfqy4gxZPSDVSYR5qn5J7gaQpMyy/MxCXBB
	VQ44RhHHdInhsz854e6BdNaP9xTrk66gPKurxqdM5OkG6b7i/87Z6AdR7NM=
X-Received: by 2002:a05:6a00:1f0a:b0:881:9f52:ca00 with SMTP id d2e1a72fcca58-8c87cb4b0demr174911b3a.42.1795106679710;
        Thu, 19 Nov 2026 08:44:39 -0800 (PST)
Received: from localhost.localdomain ([1.238.129.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e45736sm173790b3a.25.2026.11.19.08.44.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 08:44:39 -0800 (PST)
From: Sangmin Lee <45sangmin99@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	David Ahern <dsahern@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] docs: networking: correct skb_shared_info field reference
Date: Fri, 20 Nov 2026 01:43:11 +0900
Message-ID: <20261119164351.49040-1-45sangmin99@gmail.com>
X-Mailer: git-send-email 2.50.1
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

The skbuff documentation refers to skb_shared_info.refcount,
but struct skb_shared_info has no such member. The actual
field is skb_shared_info.dataref.

Correct the reference to match the structure definition.

The discrepancy was identified with assistance from
GPT-6.2-Astra (xhigh) and manually verified against
include/linux/skbuff.h.

Codex built the affected page with Sphinx and verified the corrected
field name in the HTML output.

Fixes: ddccc9ef5599 ("skbuff: add a basic intro doc")
Signed-off-by: Sangmin Lee <45sangmin99@gmail.com>
---
 Documentation/networking/skbuff.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/networking/skbuff.rst b/Documentation/networking/skbuff.rst
index 94681523e..e66adf19a 100644
--- a/Documentation/networking/skbuff.rst
+++ b/Documentation/networking/skbuff.rst
@@ -21,7 +21,7 @@ to as shared skbs (see skb_shared()).
 
 skb_clone() allows for fast duplication of skbs. None of the data buffers
 get copied, but caller gets a new metadata struct (struct sk_buff).
-&skb_shared_info.refcount indicates the number of skbs pointing at the same
+&skb_shared_info.dataref indicates the number of skbs pointing at the same
 packet data (i.e. clones).
 
 dataref and headerless skbs

base-commit: 9068e05d35f3b02a802f520e664032f802bcd2e9
-- 
2.50.1 (Apple Git-155)

