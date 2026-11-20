Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795191647;
	b=IeX+CQiXSXqEGMqIbbj0OYa5DdoWtEvSCXxrWZUrV9CwuHJ3vKxefZsWwjm9+9cap1Jj
	 oBX7v0paj9ext5Ho00ahBqDxKYl+dwo3652oqkgPelGQV5kuJLRHjiU/ro20qrW9bKcoJ
	 1ihMk/+ygYEGExWrlz9WZToFFNk/BZ9z8VPV+whx8k9293c4u2EvpnEG43H2wl9QXzOWX
	 8+fvhNZQpdB9pA/Pbs8dTWZX6OUE3MycJTTtQXrZlfmIbXVAFDc733hothsi6flWqvdPS
	 k1j6kYywIUhMJ2hZ323I4ivEh23wI+YHT7DSqOdHB02pn9Lrpv+9WF+LiTCqpQ9s7rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191647;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=oRxpEC2GG8v+kUysfDv1Clo2J6a3wzMDb38qxEUjywA=;
	b=Tn+YSZxRkOoldGamzXXhGlHKiRGSmhiDvmfQ/zOdoZZatDR1Z5JAhVE1E8mLp4VQ6zpH
	 skVQxXU0iE5gQTEsWaeBnh/dkqgs4OCzU7oKMq5OhM4KsBGuscCSA0yyWdW5OxdV2sRqf
	 nogUF4voVB9fiGAwQk7gBkykkX+DTxqytyYm27fqDFH887J3nRP1ToD+FdZO/nLEA7gI1
	 8w5vM85HzlVOXggERnDoO5Z+sGqmpQDsz1VqADf85bdeI9eWFocEmqN3/UKhfs2mOtmVn
	 cnlBataFnyqZCXNomMQ0ZSD+/Dcy52T/9QM/I83lowAF1PFdHEhZtUeshWR1xrRt1ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andrii.net;
	spf=pass smtp.mailfrom=andrii.net;
	dkim=pass header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b="m4SK/qcu";
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F430606A33D
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:20:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F430606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andrii.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andrii.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=m4SK/qcu
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cde0daf3a2aso496777a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=andrii.net; s=gmail-2025; t=1795191646; x=1795796446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oRxpEC2GG8v+kUysfDv1Clo2J6a3wzMDb38qxEUjywA=;
        b=m4SK/qcueYDr3XuCRqc7TgUWMwRcuhFcdHtQ1FBF9Zbdy4lQWhLf6vs9SK2vMlbqK4
         2dVtbe5YrdXbiV5wSQvitn9jj/ERoP4RArf9CQJZ8YCbonVWZpKLUIRSi3u4TPrVfSNU
         HCc053Mu7Kv9NA1DHUZOC/If/pZWqEwQbrdEW39w6o2Ymr0JveR0z1lnhmsZUuoYIpV3
         28XYNtgskHippdDC6wwaWV8uHljshF6bTNFuhro05DnVitr1CdD9kaXfFp3DziiMUwwT
         JqaWZ4CRsy+oPwwwyLutZ/RVdmHkUJXRX4fp4Owh7kPP3r8SWDb98FBqfxwpBLcSWcVL
         hCsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795191646; x=1795796446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oRxpEC2GG8v+kUysfDv1Clo2J6a3wzMDb38qxEUjywA=;
        b=0BtY71/W0tjWmYGM3pGwQEUiia8ycG0QiqZFx7IapxwKzrccQnZ1j2L6tqKpKUAxFY
         KdpzdIsAqPSJdaauzAi/9S8mYYsauf4k8Diyb1AQqqd9x/k3T/gfuWivrEhnMoNlvd+E
         2F6GMfishIlFeOS5V1jrAvxA9OhvstY/97xA/7y9Ayidc/6lHQYMMSKd5msU9y9B9VHo
         46JWC2dI1226gtregzhwvtM7fpuFQMfeYgO5HCUy4E3kVlVDPCAJh2b00J/c4y8CJtlo
         fhAqKTuALUhzcG9wFRDDQ1L+DwPVtZwBDjCIRrs4upuI+oT2cSSrNFfovMRnZfQWgRdo
         xyAw==
X-Forwarded-Encrypted: i=1; AL+hErEC5rIaRRVZcI65QI8wUthpBd/jmjdQ1Vcye50w5CAMdo2+EJJtXkEFH/EYThPl3+nuP3chub4ORu/uHow=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xAr0aNQPSuDmhqkcttWPkvF0A4clrxwpLLZAx75D3d2L39qWu
	8bOuUjScbpvCGlhUjLwz0CScNgRV8XauINLAbjGcQrGhYxAM5jSYmd9uK6z3m2fhvCwPelvXq8N
	nxh5YSugsiDovPsAbVqObegDB6jJEt78JeZOoQS3ysd45FYqt7/Gl
X-Gm-Gg: AZFdTZfXE/siGe14kPoJakCTOFyBPYgeutjZlc/YQgP8T15nGvPgOVMOqINLtSEwfxi
	uv9pAjpRNBKWhUOMoq9YEm45u6lYlkNrEHdEGZYDmSBtn2AlEAY7ictzncaCHb55aJ5UTbZrnWs
	f9miP2qBFnmcs07DtGRePYcbgYsamY1qRMGfAaXsQo5AEB/xI7rkgGYjDujSDLm5gmJ+w/lsUIP
	PK+DH4H1qNKO8dCj5x4zK6F5S4jpZqb97IwfM81YM3bLeg8MDlY0HSqHz3rLIukhjS7bbveCgYm
	5xYfzq849HufL43eLLxnPrXidxTGVNe/1sQG1Zt6kRWrwyUFjBpymsHqYbZ/ItkpTX6DCYePlV7
	K4csrubcQKIIEtuYWNx+gIU+J6sY=
X-Received: by 2002:a17:90b:4b8b:b0:3b3:b9e4:e3ed with SMTP id 98e67ed59e1d1-3b41cb47a0cmr3245756a91.63.1795191645728;
        Fri, 20 Nov 2026 08:20:45 -0800 (PST)
Received: from andrii.ai (mac.hestia.andrii.net. [2602:f337:ed:4865:7374:6961:204d:6163])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b40625d66bsm3383925a91.4.2026.11.20.08.20.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 08:20:45 -0800 (PST)
X-Relaying-Domain: andrii.net
From: Andrii Tereshchenko <opensource@andrii.net>
To: Fernando Fernandez Mancera <fmancera@suse.de>
Cc: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Christian Hopps <chopps@labn.net>,
	Piyus Kedia <piyus@iiitd.ac.in>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH ipsec] xfrm: iptfs: make room before copying a continuation in reassembly
Date: Fri, 20 Nov 2026 08:20:40 -0800
Message-ID: <d9a8310d-e139-4edf-9cf2-4b32664facb5@mid.andrii.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <ac558468-8e5a-4b1e-8d4d-591221b2dbf0@suse.de>
References: <ac558468-8e5a-4b1e-8d4d-591221b2dbf0@suse.de>
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

On Fri, 20 Nov 2026 12:18:09 +0100, Fernando Fernandez Mancera wrote:
> This commit message is too verbose IMHO. It is quite hard to read and
> understand.

Agreed - I will shorten it.

> Manually accounting room and need allow us to perform a single
> allocation but I do wonder, is it necessary? This is a very specific
> case.. maybe we can just call skb_linearize() first and then check the
> if there is enough tailroom and perform pskb_expand_head() if needed.

Agreed. In my tests regular traffic (HTTP, ssh, scp, ping, UDP on six
NIC drivers) never took the second allocation; only packets arranged
for it do. There it costs one more reallocation and copy, but the code
reads better. The first version of this fix did what you describe. For
v2:

--- a/net/xfrm/xfrm_iptfs.c
+++ b/net/xfrm/xfrm_iptfs.c
@@ -909,7 +909,15 @@ static u32 iptfs_reassem_cont(struct xfrm_iptfs_data *xtfs, u64 seq,
 	    iptfs_skb_can_add_frags(newskb, fragwalk, data, copylen)) {
 		iptfs_skb_add_frags(newskb, fragwalk, data, copylen);
 	} else {
-		if (skb_linearize(newskb)) {
+		/* A newskb started by iptfs_pskb_add_frags() has little
+		 * tailroom after linearizing. Make room for the rest of
+		 * the inner packet before copying.
+		 */
+		if (skb_linearize(newskb) ||
+		    (skb_tailroom(newskb) < ipremain &&
+		     pskb_expand_head(newskb, 0,
+				      ipremain - skb_tailroom(newskb),
+				      GFP_ATOMIC | __GFP_NOWARN))) {
 			XFRM_INC_STATS(xs_net(xtfs->x),
 				       LINUX_MIB_XFRMINBUFFERERROR);
 			goto abandon;

Thanks for the review.
