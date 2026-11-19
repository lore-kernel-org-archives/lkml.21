Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082378;
	b=psbRvwddLmhQv/is2GI8+W3ZEHX4DZsh1da9PWhaENikBNWUf3UYGAM/RNkyprDMZ9I0
	 TEKPLx8KXiNPDYz2MQldVvYQ02Xj6g56fZzJ9eHkAdXI8Ey67C7Uq2yfPR/jybE+aaG37
	 3JgTKb/xWjmLRM9bvJUCDBeePh7XArz1xzzLVT2g3eAULvfwd4MHze9p/3K36yaxcgIn1
	 DmYvScUNJzvnNqY+KQJqHvUQ6gMpZlyA+GRGAoxb2HZurxmVe6qRK0XiIMLbDhDtQb06b
	 2Io00TvRCQVPZbcoswyHzHw4nQN8Bfez7yqzUM8rhVAIM5U1g5daurRVCvhP3+H/fJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082378;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:X-Priority:
	 X-Mailer:In-Reply-To:References:X-NTES-SC:Content-Transfer-Encoding:
	 Content-Type:MIME-Version:Message-ID:X-Coremail-Locale:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=NfQ/MGBMF5mso9ehm1IpuBGoVkXT11CRpqrZNReIB0A=;
	b=k8jSMiVf3xmmqaeimEDw/nCXoDzfA1uC5LuCCxiuvfDlKo3cjMiKRYJWnje+pM3pWixt
	 p67t1wFLFgw0yhMqi1o5HCRrkX3s+GOsPyonVX2WKH6JHZ6o7xOiZ307XmyPZaSvlqU2T
	 RAsCgA3TZB7b4Rj52dLTI9bbW3AO1O2BG1o4hI99ncKcraqffiDYVsca1rr1gapWXd/Z5
	 LHqN3nGXaVohz6zB48Dq55sxwyIkA9c0wQCj0ljH84QAYKT2cf4+Eza3gzvs/0nxWLgou
	 Sbc4J+ZcYy0h54/e8vEP7FOnO7ao4xB7KiQH64ltlvRomgRR2PrzuqEimwjma/X7JLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=a40vdEgc;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60D9606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:59:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C60D9606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=a40vdEgc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=NfQ/MGBMF5mso9ehm1IpuBGoVkXT11CRpqrZNReIB0A=; b=a
	40vdEgckIDkBAnX1PWsdaqBFIo3gcrthG/4enzuKBJGWaPp+sn6bwCAtdK+DiEZu
	O8U96FEgHMDSqm97eIaZFw1RaqA8TWjjbXt+OAOmuX0TKxnw2gsAddtJdsr/F85J
	+fK54eEhvudDd/WmPlkYoek79LCbdvU450zl1EvWjw=
Date: Thu, 19 Nov 2026 17:58:59 +0800 (CST)
From: "Haoxiang Li" <haoxiang_li2024@163.com>
To: "Joonas Lahtinen" <joonas.lahtinen@linux.intel.com>
Cc: airlied@gmail.com, jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
	simona@ffwll.ch, tursulin@ursulin.net,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/i915/vma: Fix a memory leak in i915_vma_pin_ww()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <179507544606.16202.12430112951192190652@jlahtine-mobl>
References: <20261118153205.2432736-1-haoxiang_li2024@163.com>
 <179507544606.16202.12430112951192190652@jlahtine-mobl>
X-NTES-SC: AL_Qu2SB/yTvUso7yifYukfmUwSj+s8WsO0vf4i245fO5B+jD3pwgsjZV1FBETJ/viINTi0kjKWXDtK2MdBYZlneJs5YcLmHYKTQ5ooJVcYc/uViw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <379ef22e.83e7.1a1f33ec62d.Coremail.haoxiang_li2024@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:dCgvCgD3X1RkyP5qO15xAA--.61W
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbC7QOkE2r+yGM7BQAA3Y
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkF0IDIwMjYtMTEtMTkgMTY6MDQ6MDYsICJKb29uYXMgTGFodGluZW4iIDxqb29uYXMubGFodGlu
ZW5AbGludXguaW50ZWwuY29tPiB3cm90ZToKPgo+WW91IHNlZW0gdG8gYmUgc3BhbW1pbmcgdGhl
IGRpZmZlcmVudCBrZXJuZWwgc3Vic3lzdGVtcyB3aXRoIHBhdGNoZXMgYW5kCj5uZXZlciByZXNw
b25kIHRvIGFueSBmZWVkYmFjaywgc28gaWYgeW91IGNvdWxkIGp1c3Qgc3RvcCBhbmQgZG8gc29t
ZXRoaW5nCj5lbHNlLgo+Cj5SZWdhcmRzLCBKb29uYXMKSGkgSm9vbmFzLAoKSSBoYXZlIGJlZW4g
Zm9sbG93aW5nIHVwIG9uIHJldmlldyBmZWVkYmFjay4gT25lIGV4YW1wbGUgYmVmb3JlIHlvdXIg
cmVwbHkgaXM6Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MTExODEwMjAxMi4yMjUy
MjIxLTEtaGFveGlhbmdfbGkyMDI0QDE2My5jb20vCgpJIHRob3VnaHQgSSBzaG91bGQgbGVhdmUg
c29tZSB0aW1lLCBzdWNoIGFzIDI0IGhvdXJzLCBiZXR3ZWVuIHBvc3RpbmdzLCBzbyBJIG5vdCBz
ZW50CnRob3NlIHJldmlzaW9ucyBpbW1lZGlhdGVseS4gSSdsbCB0YWtlIHlvdXIgYWR2aWNlIGFu
ZCBzdG9wLCBmb2N1c2luZyBvbiBhZGRyZXNzaW5nCnRoZSBmZWVkYmFjayBvbiBteSBleGlzdGlu
ZyBwYXRjaGVzIGJlZm9yZSBzdWJtaXR0aW5nIG5ldyBvbmVzLgoKUmVnYXJkcywKSGFveGlhbmcg
TGk=
