Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795154322;
	b=nChaOQrQphJbXzCXkggjPlh6P49hLVu1M1LqPipJPyhRMbjFQEtRwLZdiODHQG4wXUxv
	 0S24cnqILJQqbNQQFeDaj//KyE+ZSjn0WFJxn0MkYFdYK0Pl02RslheMsPenAFF6rEwWi
	 +6HuZxCXxdgcdAmNE4lPNZbYRP46YFqt5/N7EARR/9BfS134mj5udGck4I6poguFaxkZM
	 UaqibBrYUrA/nZgJ2MtHaYhZBzxi990suPFpuZpbRfKyVWy4RNehxQCsgekPPNkqcTTsB
	 WFFcfcIqbwZHUCWSe9UWCcsUP3f3ODXX16hmeWdsvPwWaxjkZuRhQW2gW61fG6dcMMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795154322;
	h=DMARC-Filter:DKIM-Signature:Received:X-Originating-IP:Date:From:To:
	 Cc:Subject:X-Priority:X-Mailer:In-Reply-To:References:X-NTES-SC:
	 Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	 X-Coremail-Locale:X-CM-TRANSID:X-CM-SenderInfo:X-Coremail-Antispam;
	bh=sbd//bs2bSiS9ya3onVON/g2DIspX3vWG1ebZrilzPw=;
	b=DUFynG9xcEkxi21ijJXuKzK5nP7Kk0CZw1qSHu16Yr4cmYY/wy+ZnOp7UCAnb46oq8M6
	 oNX4Niix9gpG5JKdvXN1obUHPHRTvTeEkqr+EkqEi+NsJl0Dx6XoLVhPrAzRNEQOUdHcp
	 eUfjpEo/ZMpbYQK4Z89LWODwNbo830U4/Bkqgws/7E8W9GT4WZ7MIeos/C5XcqfT3zp6Q
	 FaMP5cbruaZkTc6SxQHAnswQj/3UCpX659a7mcNlEpsf4sPTaNaH1vaFrI6Dgg/DHYYm+
	 VJNLLmN29+LFDqQP7rlc/AB/OYdWTokNFzFZzmuwkddGxlnt3nSepfiVYwCLXuLN9bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=npnk2DhE;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7AC60A2628
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:58:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF7AC60A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=npnk2DhE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=sbd//bs2bSiS9ya3onVON/g2DIspX3vWG1ebZrilzPw=; b=n
	pnk2DhEj723ZvWEkcKFx1JOlRBaA2uA/ex+0YxEcLhHRyR2+ackC0KB1+pPXxFaA
	v0otHyFjkrUX5/MJRjZmXcaS4cDZ/VuGURgFTIIb4jkaZcccYMTMjZt0/rcmaS1a
	TGpmslZS2mQxQXIU6mhw8+/+VlTtGHHQ5fAfbqXDcA=
Received: from haoxiang_li2024$163.com (
 [240e:604:311:b4ab:8f9f:ca5d:948e:2fcd] ) by ajax-webmail-wmsvr-40-129
 (Coremail) ; Fri, 20 Nov 2026 13:56:55 +0800 (CST)
Date: Fri, 20 Nov 2026 13:56:55 +0800 (CST)
From: "Haoxiang Li" <haoxiang_li2024@163.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "jgross@suse.com" <jgross@suse.com>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"bp@alien8.de" <bp@alien8.de>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>,
	"Ostrovsky, Boris" <boris.ostrovsky@oracle.com>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"tglx@kernel.org" <tglx@kernel.org>,
	"david.vrabel@citrix.com" <david.vrabel@citrix.com>,
	"hpa@zytor.com" <hpa@zytor.com>, "x86@kernel.org" <x86@kernel.org>,
	"oleksandr_tyshchenko@epam.com" <oleksandr_tyshchenko@epam.com>,
	"konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
	"linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/grant-table: fix resource leak in gnttab_init()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <6e3ed5bd9de1764058a257dca9e8fd6ca9fa1175.camel@intel.com>
References: <20261117084325.1241735-1-haoxiang_li2024@163.com>
 <6e3ed5bd9de1764058a257dca9e8fd6ca9fa1175.camel@intel.com>
X-NTES-SC: AL_Qu2SB/2eu0oq4yiRY+kfmUwSj+s8WsO0vf4i245fO5B+jADp1Soae3ppF1/T886DEg+AkSSGUQdHzsB0fqBWdZwGNOdTQvvnJBFy826TJLKPNw==
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
Message-ID: <78fc4539.482c.1a1f78783e1.Coremail.haoxiang_li2024@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:gSgvCgD3Fyko4f9qWLBxAA--.133W
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbC7ggdi2r-4SjBkgAA3-
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CgpBdCAyMDI2LTExLTIwIDA3OjE4OjAzLCAiRWRnZWNvbWJlLCBSaWNrIFAiIDxyaWNrLnAuZWRn
ZWNvbWJlQGludGVsLmNvbT4gd3JvdGU6Cj4KPklmIHRoZSBQViBndWVzdCBoaXRzIHRoaXMgc2Nl
bmFyaW8gY2FuIGl0IHN1cnZpdmU/IEkgZG9uJ3Qga25vdyB4ZW4gcHYgdmVyeQo+d2VsbC4gRG9l
cyB0aGlzIG1lYW5zIHRoYXQgdGhlIFBWIGd1ZXN0IGhhcyBubyBkaXNrIG9yIG5ldHdvcmsuIElm
IHNvLCB0aGUgdXNlcgo+aXMgcHJvYmFibHkgbm90IGNvbmNlcm5lZCB3aXRoIGEgb25lIHRpbWUg
bWVtb3J5IGxlYWsuCgpUaGFua3MgZm9yIHJhaXNpbmcgdGhpcy4gSSB0ZXN0ZWQgYW4geDg2LTY0
IFBWIERvbTAgdW5kZXIgWGVuIDQuMTcuNyBpbiBRRU1VLAp1c2luZyBhdGFfcGlpeCBmb3Igc3Rv
cmFnZSBhbmQgZTEwMDAgZm9yIG5ldHdvcmtpbmcuCgpJIGluamVjdGVkIC1FTk9NRU0gaW1tZWRp
YXRlbHkgYmVmb3JlIHRoZSBpbml0aWFsIE1GTi1hcnJheSBhbGxvY2F0aW9uIGluCmdudHRhYl9t
YXAoKSwgYWZ0ZXIgYXJjaF9nbnR0YWJfaW5pdCgpIGhhZCBzdWNjZWVkZWQuIFdpdGggYW5kIHdp
dGhvdXQgdGhlCnBhdGNoLCBnbnR0YWJfaW5pdCgpIHJldHVybmVkIC1FTk9ERVYsIGJ1dCBEb20w
IHN0aWxsIGJvb3RlZCB0byB1c2Vyc3BhY2UuCkluIGJvdGggY2FzZXMsIGRpc2sgSS9PIHdvcmtl
ZCwgYW5kIHRoZSBuZXR3b3JrIGludGVyZmFjZSBjb3VsZCByZWFjaCB0aGUKUUVNVSBnYXRld2F5
LgoKSG93ZXZlciwgSSBhZ3JlZSB0aGF0IHRoaXMgaXMgYSBvbmUtdGltZSBsZWFrIHdpdGggbGlt
aXRlZCBpbXBhY3QuIEkgaGF2ZSBub3QKZGVtb25zdHJhdGVkIGFueSBmdXJ0aGVyIHVzZXItdmlz
aWJsZSBjb25zZXF1ZW5jZXMgZnJvbSB0aGUgbGVhay4KClJlZ2FyZHMsCkhhb3hpYW5nIExpCgoK
Cg==
