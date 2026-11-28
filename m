Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795870634;
	b=LZ5aJPyi/NrKrwvx1+QWW+KCdEcNf55a8MobfCbcK3Z76zLFmz8SPgU0IXfEDP1Q09OU
	 OGxgkoKzayGN4B6yZ3m3j+2SQKCGhahUFhdP0iA2oFGiGrQE+8EcQ/f/buldvjSlWepNj
	 gEVSq+6uyV7nRPDtGfDxtWXQAG4AISJVrcUJYkGYeCPDAMYhlOGSiT0gqfAv/aWczEhqi
	 S3hDNb+XydtWvSxMB7dmZU6/2ZvGFawLWQdZ+pAgJorm8vx3eCcTISAVXH5GYEANj/d85
	 Km7eD4jsBQ2XCErlzBA7JrRWx5o0jbxFs9PVvsYse7XLQoqBnc7CSU93W48Rp71v9Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795870634;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-INFO:X-CID-META:
	 X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=EPxTLPfoBK3PPgjWgiw6iGk4zPm7/v5pjm9laW56TJg=;
	b=LyHtI7IQ4fYBG+csy+cCZdQqWoVpsndQxW64AO3Nx6/FzLq/XODKZeJY1o9ncAP8Zxu4
	 VE4Hvfr3fSewDY2ABoSt9FFyGCqSdHGnMmEfk2SorJF0xkS0imjScbPtmCu7O09aDKvtS
	 81Cd2hzbVJSTU+vzPdoEge6zFAZWNcWxNhao+ZYZcVISsFsTRqKpGzpQzYfhKOc+viFJG
	 epJ/ANVA5l/tIb5YuqsLHlXJ+XLVw9pIN6FQ9caDYtdiNSDikuORaxgYUJv+jPdOsQoXI
	 rKRN2TFEEKS5WKyP4c3ishpElQltM5QeK62Sp/VTDubjTBiBC1NtjERooVXw/7XEOQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0D4606A31C;
	Sat, 28 Nov 2026 12:57:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F0D4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 2f05a882eb2b11f19a56ed5b684f684d-20261128
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:30f1577c-c2c9-4467-91ed-c9fb6eafb2f4,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:10
X-CID-INFO: VERSION:1.3.19,REQID:30f1577c-c2c9-4467-91ed-c9fb6eafb2f4,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:10
X-CID-META: VersionHash:7db8b62,CLOUDID:268a07d0d7da82e67350cb7afb98aca3,BulkI
	D:261128205657BCSUFCOH,BulkQuantity:0,SF:17|19|38|64|66|78|80|81|82|83|102
	|127|136|153|841|850|865|898,TC:nil,Content:0|15|50|99,EDM:-3|-100,IP:-2,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2f05a882eb2b11f19a56ed5b684f684d-20261128
X-User: maguicai@kylinos.cn
Received: from localhost.localdomain [(36.106.123.207)] by mailgw.kylinos.cn
	(envelope-from <maguicai@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 435226604; Sat, 28 Nov 2026 20:56:53 +0800
From: Guicai Ma <maguicai@kylinos.cn>
To: =?UTF-8?q?J=C3=A9r=C3=A9my=20Jean?= <jeremy.jean@oss.cyber.gouv.fr>,
	Paul Moore <paul@paul-moore.com>
Cc: Bradley Morgan <brads@mainlining.org>,
	Eric Paris <eparis@redhat.com>,
	audit@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] audit: fix UAF in kauditd_send_queue()
Date: Sat, 28 Nov 2026 07:56:50 -0500
Message-ID: <20261128125650.3511329-1-maguicai@kylinos.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <a9f7228c3ab1989bc1b26a0f4e686293@oss.cyber.gouv.fr>
References: <20261031211258.1626829-2-Jeremy.Jean@oss.cyber.gouv.fr> <b446cedf8a7977337389f8cdc1e5acce@paul-moore.com> <341401a3fa5863542319566051bde1ea@oss.cyber.gouv.fr> <CAHC9VhQECaSwpjUgSoCgZAgEphEk2jKnZFESn4ivM6JAjrC7HQ@mail.gmail.com> <a9f7228c3ab1989bc1b26a0f4e686293@oss.cyber.gouv.fr>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, Nov 17, 2026 at 11:36:19AM +0100, Jérémy Jean wrote:
>   retry:
> -               /* grab an extra skb reference in case of error */
> -               skb_get(skb);
> -               rc = netlink_unicast(sk, skb, portid, 0);
> +               /* clone the skb for retries in case of error */
> +               skb_retry = skb_clone(skb, GFP_KERNEL);
> +               if (skb_retry)
> +                       rc = netlink_unicast(sk, skb, portid, 0);
> +               else
> +                       rc = -EAGAIN;
>                  if (rc < 0) {
> +                       if (!skb_retry) {
> +                               /* No send was attempted, so return the 
> skb for a later pass. */
> +                               skb_queue_head(queue, skb);
> +                               rc = 0;
> +                               break;
> +                       }
> +
> +                       if (skb == skb_tail)
> +                               skb_tail = skb_retry;
> +                       skb = skb_retry;

Requeuing onto audit_queue on skb_clone() failure breaks the main queue
path in kauditd_thread().  kauditd_send_multicast_skb() already ran via
skb_hook before the clone.  Putting skb back on audit_queue and
returning 0 leaves audit_queue non-empty, so wait_event_freezable()
returns immediately and kauditd_thread() spins on the same record.  Even
a single failed clone sends a duplicate multicast copy.

v1 handled this cleanly: pass the clone to netlink_unicast(), keep skb
for retries, and let a failed clone fall through as -EAGAIN to err_hook.
For audit_queue, kauditd_retry_skb() moves the record to
audit_retry_queue, which has no skb_hook, while rc is still cleared to 0
so auditd_reset() is not called.  Keeping skb also avoids swapping skb
and skb_tail on failure.

Thanks,
Guicai
