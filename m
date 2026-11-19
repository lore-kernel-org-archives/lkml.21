Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795127975;
	b=z82y9MOUFsxtc04IlJUzPvzr1UiEnKBKTwAIP5sy/HLtYvdl+Tr2ObQszHvtVAmysVj3
	 lyWdppeGJBgCzFl6/Im0f4R1E6qZ2ZaomVv2lGDDZXcDYmn5mmvC6UlrKP8N6fXNDk6Ig
	 MBDzhjSt8z6ImI2660WTBI4munN3rgLww6Qjc8EMO5Jadypk+6cbjNjnxrPM9yIvrm121
	 25GNNit1WZt8/1RXu+nxyD03XweTxA/c4VH+ZLyEB3xmgANjwWssrG824j5UlO7mi33Ix
	 2Gd3Uj+r8UBzkgTTjeTp1mevLbRWJ4tNU7uGcr6SaFSpI1Ru+hjveus4yVELPtM8oCg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795127975;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=EFMleqBqxY4YiuZcUudUuznwj41usVHUxpoOdk7wGx0=;
	b=Kpw19zh+4KyWIMSJfkYWMa/mbMDGeutnRDF99VPwMO5HtPjll1rkVRtbIzEOXbbk6Lcu
	 c0NfRnoFF72okIcPR74nzXTenJzbDpKjWG0oXgRJC/Vn98kZu7AuBVc/FH6NI1XISy+4+
	 9DnGSqd3zbEN4KzrDeKw8Z98sUzqKWA1hRsbew0/nR5wna6chSj5POSVSY8VdBVfoRWCG
	 StvBIuDCerngzakt1fDvgmTaBEUsNiFrowYCGRx9dAGGG5wS5hFsVkSPKfffuWxAvv/F7
	 LykZr8wsVCjolXed9Xp6fP6fwT4UTAUWeTOU4tLq5mbpCtG3sLCEQNpPoMAeHPed0LQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OL01HSkc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20CF606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 22:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OL01HSkc
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795127974;
	b=KylaaxggdAXLVxQf37Kn/6wavjPCsaXRULbu28HBVi8g9JO2ddeBizS2smKzOqDWdTpm
	 NYA8cwDOl+IC8TfsoBJsDP8LBiGwA9OhnXiYAw3XlVEWl/xHnWTZp6HkniwRCdmr6ZcLj
	 CEuav4g/qySRmNC633EWkomF/gPsQelCdD0rSRSe9t0X/5pkLeaRO/HX03hvSJbmbVL8w
	 BhvgrGUdfMxrBSwRK4IQ3DUwzwjG76d3qw7bcjUnpAM4QgxeXfzXRbHVbn+ZKMjLIMpZX
	 bSH+YOcfqEm742ncM5wMNXB+yB1tV+FJeGJCw6CZ+CZKLBAMyT0DmGTtSDYhy7UUGVA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795127974;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=EFMleqBqxY4YiuZcUudUuznwj41usVHUxpoOdk7wGx0=;
	b=HHoDVYeJsW8sQfLu4lmG0X5SLTkzVWQ9WcwoQSQdqsz/EBSXJBTFqOU2yuThsuL9lEO6
	 YSGqzQ5qq1FCJ6Oh8DOLCOA9qVMXq22okO9iOeE67BKSWH033zNzIUsJaBKPHB+ujdVH3
	 TM/PUzM5EIMM/+wIsBJgXee3VwibGWfQOsljGO5CeYRCFDXPs4lK47CzL5g8DiPESmHQY
	 rAa1u6aqy1O3rUe7sUDtQimP9pJTSu2/RUUGz4UhliW2eHRDoaJTgWWY4VwWBpkapR18S
	 npn9EXl+O6x2BAGIJHlHxOFSBUHXGQgwzYOt3GGciKj92ZMeEM3bMeCvEE8wyhGsayg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 453681F000C6;
	Thu, 19 Nov 2026 22:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795127974;
	bh=EFMleqBqxY4YiuZcUudUuznwj41usVHUxpoOdk7wGx0=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=OL01HSkcUob/OZ7UacBtjTpzm9QcTEBSoodI5rEQOJOn7UrA0jO7qHLPqJlZkT09r
	 BYMXEIJDbmmnJfEl8uH7Qfl16Dr3JuuYSuWEoC349nyrTain2+Fui8erTF5316mroC
	 yJa+oq0sWh6q582njXRGYy+gx5lUy1l6UryXz07+VkJBxGKGlVG+Zkm/dR4m49MIBp
	 XBMhvzFEDULMkBgCfXE5Q/PFCoc5nfp7Jh7rdFxh30HdUmsNI7FMvPQ4CZ0kUlG5V8
	 9YJvvQ66Dg2+DIlIjpyy51kHhNmkTH8qdyrSiUJfB3K6m1KZnLY0IwzEFL+8VrNf0e
	 pvgdnZ9dkID5Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BB71141B3F;
	Thu, 19 Nov 2026 22:39:33 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Date: Thu, 19 Nov 2026 22:39:33 +0000
Subject: [PATCH] um: vector: Don't clean up NAPI that was never set up
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-uml-vector-napi-v1-1-b3751cf4fa60@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKR6/2oC/yXMSQ5AQBBA0atIrVWiWoxXEQtDoYQm3YhE3F1j+
 Rb/X2DZCFvIvQsMH2Jl0Q7ke9AMle4ZpXUGFaiYiDLc5wkPbrbFoK5WwTSNEtWFdRYSg6tWw52
 c37Eof9u9Hl3xbuC+HxUyOGlzAAAA
X-Change-ID: 20261119-uml-vector-napi-88572f3b931e
To: anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net, 
 richard@nod.at
Cc: linux-kernel@vger.kernel.org, linux-um@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795127972; l=2916;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=8Y+O44qYrjdqbAzW0Oc18LWnlpyxhaxzbOh4UGR+4is=;
 b=1olmBNnFslciyrZdOshl2nFiY/pp6dtf+L/vnQ7IJmgrX9G3QDMhk/nWYpP8SPcV5NB00G7e4
 pHFgwy9Lf83CXyZqLWZeGfgHelQ1lh4EaNaA3DsKpNeCmfstWN53hFK
X-Developer-Key: i=shyckless@gmail.com; a=ed25519;
 pk=pMtccVGiWES3bV+7YBFuBclkvq2n2HBHQ5azaBrK2lY=
X-Endpoint-Received: by B4 Relay for shyckless@gmail.com/default with
 auth_id=1498
X-Original-From: Suyuan Wang <shyckless@gmail.com>
Reply-To: shyckless@gmail.com

From: Suyuan Wang <stevewong@hust.edu.cn>

vector_net_open() calls vector_net_close() on any failure once
vp->fds is set, and vector_net_close() then runs napi_disable() and
netif_napi_del() unconditionally. But the NAPI context is only added
and enabled after build_transport_data() and the header buffer
allocations, so a failure in any of those disables a NAPI context that
was never added. napi_disable() locks n->dev, which is still NULL:

  ip link set vec0 up   (vec0:transport=gre,...,rx_key=1, no tx_key)
  Kernel panic - not syncing: Kernel mode fault at addr 0x910
   napi_disable+0x4e/0x9e
   vector_net_close+0x2b9/0x87d
   vector_net_open+0x105d/0x106f
   __dev_open+0x244/0x334

Record in vp->napi_enabled whether vector_net_open() got as far as
enabling NAPI, and only disable and delete it in vector_net_close()
when it did. NAPI is still enabled only after the queues and buffers
that vector_poll() uses are set up.

Found with a static analysis tool and checked by hand.

Fixes: b35507a4cfb2 ("um: Migrate vector drivers to NAPI")
Cc: stable@vger.kernel.org
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
---
Tested with UML (seccomp=on) on top of the um fixes branch: with a GRE
vector device missing tx_key, "ip link set vec0 up" panics without the
patch and fails cleanly with -EINVAL with it, also when repeated. A raw
vector device on the host's lo still goes up and down twice as before.
---
 arch/um/drivers/vector_kern.c | 9 +++++++--
 arch/um/drivers/vector_kern.h | 1 +
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/um/drivers/vector_kern.c b/arch/um/drivers/vector_kern.c
index 8008278ccee7..021f14780b45 100644
--- a/arch/um/drivers/vector_kern.c
+++ b/arch/um/drivers/vector_kern.c
@@ -1137,8 +1137,12 @@ static int vector_net_close(struct net_device *dev)
 		um_free_irq(vp->tx_irq, dev);
 		vp->tx_irq = 0;
 	}
-	napi_disable(&vp->napi);
-	netif_napi_del(&vp->napi);
+	/* vector_net_open() may fail before setting up NAPI */
+	if (vp->napi_enabled) {
+		napi_disable(&vp->napi);
+		netif_napi_del(&vp->napi);
+		vp->napi_enabled = false;
+	}
 	if (vp->fds->rx_fd > 0) {
 		if (vp->bpf)
 			uml_vector_detach_bpf(vp->fds->rx_fd, vp->bpf);
@@ -1260,6 +1264,7 @@ static int vector_net_open(struct net_device *dev)
 		netif_napi_add_weight(vp->dev, &vp->napi, vector_poll, NAPI_POLL_WEIGHT);
 
 	napi_enable(&vp->napi);
+	vp->napi_enabled = true;
 
 	/* READ IRQ */
 	err = um_request_irq(
diff --git a/arch/um/drivers/vector_kern.h b/arch/um/drivers/vector_kern.h
index 5f0ceb80779d..e1b697266fa7 100644
--- a/arch/um/drivers/vector_kern.h
+++ b/arch/um/drivers/vector_kern.h
@@ -118,6 +118,7 @@ struct vector_private {
 
 	bool rexmit_scheduled;
 	bool opened;
+	bool napi_enabled;
 	bool in_write_poll;
 	bool in_error;
 




