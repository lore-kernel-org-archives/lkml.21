Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794942175;
	b=fgfVSlGYSbDvVwg/EKbmF15I/lom0CrBiNLWBWPIKoA7THe06+k4/OIichGUBsAIyADd
	 6hAekqYug0R6ZTcIBDXif2ye4fC0385QAa1hpQ5rTUpcOSBmp4cXhdgV/dsGio9OM+fOO
	 ChL+ZxMa8tupS9IKuwugKBBUJRxZUQbOg0tfJFNUFLlVEQlce3+JXwpGWyQMdx4wnDTmQ
	 Q5KBj5dKjal5Z021/c1pYgdJCCPS2zzwpKeOrrmt1scRI8iZUgrke+OmsGT4973nUQJ8A
	 ye88LVySvPYm8T6GjT70KhsP5UupisagMZFkh/lwggNWqIWD5D2PvFJCqL2rApu6oSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794942175;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=EhI5TLOlL+9vNzhu+UAy+2REBUSKFNqlNp3HDll8Qkg=;
	b=3B84mPfil1UqWihCxJ2YXknPECdpWvUF2ttuURhcNn/xDcgE7nNOP4zhqbpXtikP57eu
	 PHGaww2xTfa3JN+S+iaj3hTTrGW8vIMQK7k1ezC5yiyDvcIYZhm76Lb7tD2N4Wl2zCCSQ
	 m2AE/dAQLvt6rblwjO6vaHmTxFoR6AI5uJCHJNTzD4iqJaMDSbaJ+win9zZzHAmU6fh7H
	 W7Fa8w/t2Ht746+0ZBCAYLTmYv7OviG2Tt4NrD0F7DtUFTW/8zdOvqHCo3os9iJqNjAFp
	 fEyYEzbXW8T5a4FNQh4T5/AgKrlOnuKDgnn0Mz79solWSJMQ5VRK5zQgbauYxb5QUQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SZv7BbFj;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=djsaEppF;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346FE606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:02:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 346FE606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SZv7BbFj;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=djsaEppF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794942174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EhI5TLOlL+9vNzhu+UAy+2REBUSKFNqlNp3HDll8Qkg=;
	b=SZv7BbFjWPDOQ2LRlb+FFdIMM+yRBNSl1BjTonF6ONMrBXgZH9cM/UzvPvLGRBeH7Sw8rl
	sx3H9uUUcplg4fUCYJXzA6KaD/T18JvnnPAbD+NSccNhT/LkKbRaS3KslGRQLTwjAlEDwv
	7dmy00cQev9exZMVciCHqCp9KnTAWYo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-137-P-84Ri5jONahR1wFeMPJwA-1; Tue, 17 Nov 2026 14:02:50 -0500
X-MC-Unique: P-84Ri5jONahR1wFeMPJwA-1
X-Mimecast-MFC-AGG-ID: P-84Ri5jONahR1wFeMPJwA_1794942170
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48e0389d6f9so56089f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794942169; x=1795546969; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EhI5TLOlL+9vNzhu+UAy+2REBUSKFNqlNp3HDll8Qkg=;
        b=djsaEppFheB/OSdCyYwXFM96wxsVd5uWgRNozzLPp8iRTQU86Iv5hY6ZWGPprCfSX1
         JCZbc5GY6XGnLwNc74XhTHwlJRLTGsrkCJpA7YMMmIDJWsk4NUeA8hAy6YlpuNgB0ZsB
         vWba4yokU0i0cuCa/tdHNqmmNzitoMnD/Kh3Ro9NCo5isu79kkb2ap4d7YgQXLMCIXCP
         CN0MloMBQROoYjnP6kSQWT8amReza7DWPObHqqZWGIkZVPX/BgpDU4g/Fp2GyEIu8sHM
         +7AMtDPj6DhqGlQ1bQ1eLgc8ubvegI4htiGlMtSjYKMlaswawPr00WRu9/oRUcYLWVfL
         hvLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794942169; x=1795546969;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EhI5TLOlL+9vNzhu+UAy+2REBUSKFNqlNp3HDll8Qkg=;
        b=NmXzAb7aKktlq1t0SdhCtM4S1Qij9zWjztF8IQFA1qXgcOPF1T4155uEfUoncwcnqO
         CPygwxjaggrayHcth4hrnVEAcLWi0tOvuZTKUR8ptE2EUeYqxpJHIBAnVUZqvYR5AKrD
         nylus41Cul2EqVVpYJinfSJQd8U6ScT0JfiRGHEW/OiDjzarnjDWnf5amsjz/NswQERE
         yOY8gq5OSUizpA2O9yH1pMs2gx36V9/GZzZDz81LXK4d6Tl/H/tSSVKyu8sPR6BZdgia
         5HN9K1moKWDnw589p3gJvrRf6q/v3UFrBzPD1W3zOvDJhc+C7NIyFJgIlq7pUeAjYnrM
         BU3Q==
X-Gm-Message-State: APuU4Z8jO7eXWIDp8O79Q0eOWFAD+cCUAEvdaZj0z5ZQajGtF4oSxl0N
	KSKRJiyOoZsD9f9MaBDgdvMJIB4BP5C1Ol95QPdPthXxAMWpqNYgMA9vLu4n5Eqa/qj9E74Qwo8
	uB1EK9Ai77twfLdcO/lC1jXDgFdYInY40lcfKK1n8sC79xDzRGiWAJoZS7k12iKGWnQ==
X-Gm-Gg: AZFdTZepOz7iNWycF551vIzJ2pOf0ZWTJT+Kcn6s7IZtwB8448FBdg2XX0W+tmNGPff
	SDfc2FhcciHfqrAPgwQ9+jab8a9tWYf9YIdbLGlif90+AX4cGM+MlMa9lkfdW3SdJYWq3dlnDh/
	2KqwcgGgrqO+REwsYaFWoH0vXR2nJHz8bujYKhGT6T6ZFSukCuDGI2IzIpBp9DqW+0SrMyK7I4I
	bbLp0sMT5OM3ZEjkFsYqE3+FojWIIQQ+PaV9LiiSws1VMWU80VdTw9TB26Q3eYNIg7SvA3JfkhX
	lne40Lv+633X+bblRCPIBXCKFLVpWRBSGzoa2QNbpJvlSlXPcPW23AouuTiJNBK43T1rjWcEKtL
	g1t2E4hkQHGw1sE4zima1xYOlkdykVjAs7Vjs2LfkPROOA47DCce1iPinyale4tIQVhJ/2ggcW8
	tqimAd5LrylJs=
X-Received: by 2002:a05:6000:3108:b0:48f:bcf0:2026 with SMTP id ffacd0b85a97d-4a6389ed16amr883019f8f.13.1794942169607;
        Tue, 17 Nov 2026 11:02:49 -0800 (PST)
X-Received: by 2002:a05:6000:3108:b0:48f:bcf0:2026 with SMTP id ffacd0b85a97d-4a6389ed16amr882975f8f.13.1794942169208;
        Tue, 17 Nov 2026 11:02:49 -0800 (PST)
Received: from [192.168.0.19] (217.red-88-4-146.dynamicip.rima-tde.net. [88.4.146.217])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656095e98sm276159f8f.42.2026.11.17.11.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:02:48 -0800 (PST)
From: Sergio Lopez <slp@redhat.com>
Date: Tue, 17 Nov 2026 20:01:52 +0100
Subject: [PATCH v2] vsock/vmci: reject datagram binds in local network
 namespaces
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
Message-Id: <20261117-vsock-vmci-netns-isolation-v2-1-d6f35e86416a@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQrCMBBFr1Jm7UgnrS248h7SRUhGO2gTyYSgl
 N7d2BO4fA/++ysoJ2GFc7NC4iIqMVQwhwbcbMOdUXxlMK0ZiKjDotE9sCxOMHAOiqLxaXOd4cj
 9MHbGOz92UAOvxDd57/HrVHkWzTF99q9CP/tXthASOvataU8924Euif1s89HFBaZt277ToLM+x
 QAAAA==
X-Change-ID: 20261113-vsock-vmci-netns-isolation-7e46732dcd73
To: Bryan Tan <bryan-bt.tan@broadcom.com>, 
 Vishnu Dasa <vishnu.dasa@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, 
 Bobby Eshleman <bobbyeshleman@meta.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, 
 netdev@vger.kernel.org, stable@vger.kernel.org, 
 Sergio Lopez <slp@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2665; i=slp@redhat.com;
 h=from:subject:message-id; bh=TprLl35HMOZ700RHSD7wldVyF8nfQtfAOCm+aXiPq8I=;
 b=owEBbQKS/ZANAwAKAfRpJ40vDAI1AcsmYgBq/KTKg78yHHA1T+U5q33lvKFKhEHajCHacKczx
 gRFaBZa1/uJAjMEAAEKAB0WIQS+1fz3US2GgJFC6KL0aSeNLwwCNQUCavykygAKCRD0aSeNLwwC
 NZmaD/9qZAz5FLYTpTVOASrTHfMHxQjA4+DunomqrpVGDSV+BIUU2Ro4t/zHcZhv9m3tc0lx8s0
 FimzrAPcFwIDyWn12MetCnXqsav6Up6oXDk8BTuKWa0wGZbEBoBnlQ25ywTodqur3XXTnkYP+Ls
 VCCJCeNA0vfttrII+qqFdAHIXDfxPQefp2MFrsplHJQEIrWw6ZUKQ6m9oUDUFmr8PGKhJ0zlnA6
 b0F6nHW0nyX+mHPh8vVOfpDE1hQIwtxb5IKnpYVpzgBGFAufVfbvl31VzykbyGMJ9bECmhZZ9yN
 CAIBHlb3PzFNXUT8tHPcpL+jqUC8roU6si7hcqfEiOynAFoiSq0w5lu0HKWxbdwk+thKngd8jzY
 z3Y6eHNWdUSbdWABZalFGN1yuUe0gp4AyjGlxzvF2AqmhtpvFHGeCehA0WfJEgEDi+pfaNWoJCP
 mEwSJMxhOKxpfCXAjRK5d/PI0fD0B9TOLxR5JDKUs3CWhc39NTXYxZ5WRAQS2sw27SS8/VLVjF7
 t3MtOExaHVigSx0R20rRWKNucV7t9gZOFktQXvOYYpKRyOov8EFHkDA1lGlLtaBLn+k++acUzSR
 Fktu3CdnHDFv9AWIl8hgc1PTbBJhizS50YTN+u1bvIVXMcvV9t5Yufk0RGOKinb0zt6X8293phK
 vVURjCf2xVn2qNg==
X-Developer-Key: i=slp@redhat.com; a=openpgp;
 fpr=BED5FCF7512D86809142E8A2F469278D2F0C0235

VMCI already rejects datagram sends from local network namespaces, but a
datagram bind still creates a receive handle in VMCI's global port space.
A VMCI sender outside the namespace can therefore deliver to the local
socket. Its handle also prevents a global-namespace socket from binding
the same port.

Reject VMCI datagram binds in local namespaces. No namespace-local
datagram transport exists, so EOPNOTSUPP reflects the available receive
paths. Unbound datagram connect() and sendmsg() also return EOPNOTSUPP
because both call vsock_auto_bind(). The receive callback rejects any
local-mode socket as a defensive check.

In a KASAN/lockdep QEMU guest, a reproducer observed cross-namespace
delivery and the global port collision before the fix. After the fix,
local bind returns EOPNOTSUPP, the global bind succeeds, and a global
VMCI datagram still reaches the global socket.

Fixes: eafb64f40ca4 ("vsock: add netns to vsock core")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/all/sashiko-outbox-212907@kernel.org/
Acked-by: Bobby Eshleman <bobbyeshleman@meta.com>
Signed-off-by: Sergio Lopez <slp@redhat.com>
---
Changes in v2:
- Combine the VMCI receive checks and clarify the auto-bind effects on
  datagram connect() and sendmsg() (thanks to Stefano Garzarella).
- Carry Bobby Eshleman's Acked-by.
- Link to v1: https://lore.kernel.org/r/20261113-vsock-vmci-netns-isolation-v1-1-ced02054ea61@redhat.com
---
 net/vmw_vsock/vmci_transport.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/net/vmw_vsock/vmci_transport.c b/net/vmw_vsock/vmci_transport.c
index 1f186e8f8364..d53704e31af3 100644
--- a/net/vmw_vsock/vmci_transport.c
+++ b/net/vmw_vsock/vmci_transport.c
@@ -627,7 +627,8 @@ static int vmci_transport_recv_dgram_cb(void *data, struct vmci_datagram *dg)
 	 * outside of the create and destruct socket functions.
 	 */
 	vsk = vsock_sk(sk);
-	if (!vmci_transport_allow_dgram(vsk, dg->src.context))
+	if (!vsock_net_mode_global(vsk) ||
+	    !vmci_transport_allow_dgram(vsk, dg->src.context))
 		return VMCI_ERROR_NO_ACCESS;
 
 	size = VMCI_DG_SIZE(dg);
@@ -1697,6 +1698,10 @@ static int vmci_transport_dgram_bind(struct vsock_sock *vsk,
 	u32 flags;
 	int err;
 
+	/* VMCI handles are global and cannot serve local namespaces. */
+	if (!vsock_net_mode_global(vsk))
+		return -EOPNOTSUPP;
+
 	/* VMCI will select a resource ID for us if we provide
 	 * VMCI_INVALID_ID.
 	 */

---
base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
change-id: 20261113-vsock-vmci-netns-isolation-7e46732dcd73

Best regards,
-- 
Sergio Lopez <slp@redhat.com>

