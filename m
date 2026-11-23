Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795466591;
	b=qzwm1ZquOB7XCNZgviCeSHlbiaC0Gjvg6jTXSkSHuTPnpmLRm8fhw2mvRisCUsQRwLrB
	 3wr2Lp3SnvMz9TIcLiqjZMvBnAw1/h/ZK0aNcHfgO1vJ5KFw9hweDDh1KNCRa4BYoymTE
	 Q6BPFZ0/RNW5V0Zda3CoGtZL7LXenZFwFbrIj8osXOu33QYLlGNUojlqNtDa4tUuKos3V
	 JwwMWNZhYXtyFrx/ezdaLn8g0DFdrznV85sbhZ8ygiNp+TgTXTq3Ki0wPvlBk3SY/loKu
	 OOnsXm0Vk26wzTowbfoEsGcZ8rAN4oXFgiSYb8ApsaNNhnfBz0Z7wSxaaHig11tKz4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795466591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CxAc7sA9aEFc/cgGMwpQLH2BX4UWpk4VulV34Xym2pk=;
	b=Nw7BLONZVwEfCo/HotmNzmymAdV50uPKShtq8S9abk1+Yj3Wma2FVfFq8FMLzn6XOgxO
	 eivQ1C4CGO7FQ347kdQBS6xD3/IBWR+JKHML8i2iMt3l/RFkVxZSjvNBP//rgipd3Gpa0
	 yPOmymsJ9JquIqE7xb+AvqNtzeHLUmq5v5yr4ckjmrnmZfGN6g2xkCc2m1/11DdlF/3N0
	 4GIEojVqXNORHjVqxEjIBxS6KEJOzP1v0IyQK+LkTO+oSUjMmyw4qQ3ftcCOAxN5Foj9i
	 7rrOI+uhO3erar6BAa7xGzga4UXjEKHsY0Hu/3Qs0+Grhd36dw2d1N8cXxrYTvK9jkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=is.s.u-tokyo.ac.jp;
	spf=pass smtp.mailfrom=g.ecc.u-tokyo.ac.jp;
	dkim=pass header.d=is.s.u-tokyo.ac.jp header.i=@is.s.u-tokyo.ac.jp header.a=rsa-sha256 header.s=google header.b=mIK6uVWU;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9F4606A332
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:43:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A9F4606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.ecc.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=is.s.u-tokyo.ac.jp header.i=@is.s.u-tokyo.ac.jp header.a=rsa-sha256 header.s=google header.b=mIK6uVWU
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b3acec6677so5336332c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=is.s.u-tokyo.ac.jp; s=google; t=1795466590; x=1796071390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CxAc7sA9aEFc/cgGMwpQLH2BX4UWpk4VulV34Xym2pk=;
        b=mIK6uVWU5+x+qlXehQVkgKQBpccZzm01Z8kOLaJEXAOvZi0618t0YBbuxuenYkv3Ih
         nyV64qSqWXEOjXfMsYzz984P2HE5mTto+ldmeXZrCE3h9/RB5VpzEmfjGJUTGJmDZ2Gr
         8ENJxtaPkSHypea2Ff+a4HQhKaMGYUGMkRRN1lRE7XOYvnXkGSXDOPXts4YxuHBcSoyE
         m5/7ofJ3L22tASqxQGV0cs8u60dMX82QgXN15Y0AAMk6KttXs6FcTDMLqc9yxIYxuJ0r
         38zGA7oEHev0XIqO03K+l9yraz7rWCfMFDDKQCaJIS9XGnLs5DKzh+OcEyb2jqQvh8SV
         VGXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795466590; x=1796071390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CxAc7sA9aEFc/cgGMwpQLH2BX4UWpk4VulV34Xym2pk=;
        b=yv9K6NiddgTNSR34Q7nh3QZ7xHGzfBG8ewuiRP6mLQ/Wlyuedz662Jn5iKrUScFh7L
         5EIqU5GsT7Rq27Tk3oiyrmsYoHjX3ocvA2vV/VpdsGtBbMFlUgbBmjI32OlCQykBMKaS
         P3W+bnCcrKwEOP2Qm0+WDrM2Mpm8y6V3IdKBl8tkdoHvN0JSgcbOmgfNSP3MvzvpdxXB
         fjf36RJ5hj883VFwJG98NvYtZhy8InMN0Lmh3kiC3JBUhxKuvCZ4/LiUDAiVljmuIQJI
         s692jyEfMqvI2xq2NKR4qUKnoD9GkehRMb8slk69lUBzgZwVwD0FWiaczeZ2SQjNUNVJ
         XSZQ==
X-Forwarded-Encrypted: i=1; AL+hErHbR6EFxwCBAnUGGY1162eoVGvsMViE/lvcZmD1sO7YBTc8aCVgy2MLEMD0BrCYVL9F0Lk+62xA1bWRJJQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z95e03coQurnEeW+LT/z0pSSSuaKUzYNE3tAI2hOC0LP92xYVSh
	5jif0/8QLsZGm6x/fAuhGmFlmeqi4nlWt7fOf8sfWzNH02eQiUXmP3M2cbCD82bdBQ==
X-Gm-Gg: AZFdTZf3xF477Vcqy31se6I+cRxgaeNl8deIhBTyyoWY+96WUMUAE8/080ccdJr9xb1
	BhIWUvVR8lkx9wZ6IL3hLoChnRZddP99f6sYvhsG97Upf87YwKN0E4cmFIPWpUc4g5Wg0CGjK2E
	y0FYzw93ZcUprQ5FYQdsiUkLluxGJMu26ppKDhlcIKIm7ZqKdiaE/G6yYtiAuWRhi57S6Narz3e
	PNAMcHgybrG0KSywrskiqerHPz8pnvM6KmjuuEjVjSYgztBa69BewaxKBaTXxDNrQH8yMXk2A8t
	VLn+0w0dooXsYwfs07xwrmw+q2tpNnP/B3BU366qagRNY+QCDWtnlRKtNN2v7meRu8CeHBMB44s
	KT81v+7AyE+ygLTwfjPVnnJdmPTsBQVveggjJnYYPJJjp8pIwMEDWwzjXU0eInw9skPAFmQuISq
	nFxfsG9QJKeQVO7fkhK+2T2x2qL8FihfT2lC6QXgdTnCbNcT2Tne/p5uZoMS2oD5cDZQuwluCv/
	RlqWRPXS4mmlOLS/0kgjjMhBroNXxkd5IEA3897ruXA21WOSymQHWkgwkSkTl7d6KaASGOtx/hY
	9fIf+bUlRNiccqAcpolF+q57C45KzbtOuq22Fw==
X-Received: by 2002:a05:7022:3a8c:b0:1b5:3490:d715 with SMTP id a92af1059eb24-1b55691e0camr12826076c88.34.1795466590192;
        Mon, 23 Nov 2026 12:43:10 -0800 (PST)
Received: from wang0.localdomain ([133.11.33.33])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm17407732c88.4.2026.11.23.12.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:43:09 -0800 (PST)
From: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
To: Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>
Cc: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Tomas Bortoli <tomasbortoli@gmail.com>,
	v9fs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Takahiro Shinagawa <shina@is.s.u-tokyo.ac.jp>,
	stable@vger.kernel.org
Subject: [PATCH v2 4/5] 9p/virtio: set REQ_STATUS_SENT after adding a zero-copy request
Date: Tue, 24 Nov 2026 05:42:56 +0900
Message-ID: <20261123204257.3055515-5-lian@is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123204257.3055515-1-lian@is.s.u-tokyo.ac.jp>
References: <20261123204257.3055515-1-lian@is.s.u-tokyo.ac.jp>
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

p9_virtio_zc_request() sets REQ_STATUS_SENT before adding the request to
the virtqueue. If the wait for the ring is interrupted by a fatal
signal, it drops the virtio transport's reference to the request, since
the reply won't come, and returns -ERESTARTSYS. p9_client_zc_rpc()
flushes the request on -ERESTARTSYS, and p9_client_flush() calls
p9_virtio_cancelled() for a request in REQ_STATUS_SENT, which can drop
the reference again:

  refcount_t: underflow; use-after-free.
  WARNING: lib/refcount.c:37 at refcount_warn_saturate+0x84/0xd0, CPU#3: dd/314
  Call Trace:
   p9_req_put+0xe5/0x190
   p9_client_zc_rpc+0x537/0x980
   p9_client_read_once+0x237/0x6c0
   p9_client_read+0x9d/0x140

Fix this by setting REQ_STATUS_SENT after virtqueue_add_sgs() succeeds,
so p9_virtio_cancelled() is not called for a request outside the
virtqueue. The status is set under chan->lock, before req_done() can
set REQ_STATUS_RCVD.

This patch is assisted by Claude Fable 5.2.

Fixes: 728356dedeff ("9p: Add refcount to p9_req_t")
Cc: stable@vger.kernel.org
Signed-off-by: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
---
v2:
- New patch.

 net/9p/trans_virtio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/9p/trans_virtio.c b/net/9p/trans_virtio.c
index 8d9555e64490e..6d1e6093db095 100644
--- a/net/9p/trans_virtio.c
+++ b/net/9p/trans_virtio.c
@@ -467,7 +467,6 @@ p9_virtio_zc_request(struct p9_client *client, struct p9_req_t *req,
 			inlen = n;
 		}
 	}
-	WRITE_ONCE(req->status, REQ_STATUS_SENT);
 req_retry_pinned:
 	spin_lock_irqsave(&chan->lock, flags);
 
@@ -526,6 +525,7 @@ p9_virtio_zc_request(struct p9_client *client, struct p9_req_t *req,
 			goto err_out;
 		}
 	}
+	WRITE_ONCE(req->status, REQ_STATUS_SENT);
 	virtqueue_kick(chan->vq);
 	spin_unlock_irqrestore(&chan->lock, flags);
 	kicked = 1;
-- 
2.56.1

