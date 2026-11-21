Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795243359;
	b=sPETjazdL+P6Lyx+2AQ73YlRvaZfkrFE2fZk6V5RRKgj9jMXWW/uQ4T6Rn/zXFgGvfbK
	 2WjpM2no0VeBXIS0Wt3Z8QhP2v2gSVmhRKj8757wyaWdbdGrqu4MLa03Uu8VArYdD/5A9
	 MjT1i2edLAvXhXYOs6idqrIySGPP0ZfqsOL+y09p5mjBE8FTCcQB760RBCdn000rfVwR9
	 kmkT8WA9xiphtg+F3lSWrcBj6fRFkiiTzCDcPoWmykKUWGfxtaKPtoQQM/8RU9RJvm15a
	 ElmHeMeYXaLHoWrVVHyEaifErjCXNcWrlgl2iSacmDjCSefyswzkl0xdm3WZyKuc+fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795243359;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:X-Priority:
	 X-Mailer:In-Reply-To:References:X-NTES-SC:Content-Transfer-Encoding:
	 Content-Type:MIME-Version:Message-ID:X-Coremail-Locale:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=k5BKq+xslui1xiJuqhlDdIUc8BouYoKQVy88v5Nuwjk=;
	b=1PgWkIhuTl4qRFk1PZsuA9AMj0Dq4FX1nvs1ZNwzhWOZU7/AQD8Nys658leYjUuHkOLB
	 azWBa/VqY7orsu/jzGjvJUKDERH2Nt6Jd2L8ul3Cyg6ig5OUvWw1PxrOoazJ2amFzSdMH
	 MSK9nMO5LuIwFXlOfy4PYVphhL/RRW2OqoSek3rRBQCSITK1/wGhimWmyqHkR23ZDkLzy
	 pOtrec9UExF+V4J+swwnrM4yDHkbb2MDXUIkCBqupyKGHffsX9Ro0BiR0shvc6GQHrRWY
	 b+xlMbnDXswhhT6+gWhlk/WrvCjLCZ6EN/j9rYt3phP8qW3QQa3AYrHGJ/FG7LAVfng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ML9A+ras;
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FF2606A33A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 06:42:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6FF2606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ML9A+ras
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=k5BKq+xslui1xiJuqhlDdIUc8BouYoKQVy88v5Nuwjk=; b=M
	L9A+rasjEd09mRq4I+ha2qCnc4a4TFNHzYt7WNniPk9Eq0fXLlOhmKiAzbGhGEwU
	oObqNvLpFxB0zO7ja5ZPKhEwR/yyrPVs3JLodx2QAGZeGIAtZxNfpWVqpoxJYdyn
	fwtUOyBNVmILMM6tUrugIQzW91h6KIMhFSzeQb7E9w=
Date: Sat, 21 Nov 2026 14:40:51 +0800 (CST)
From: "Haoxiang Li" <haoxiang_li2024@163.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "Ostrovsky, Boris" <boris.ostrovsky@oracle.com>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"david.vrabel@citrix.com" <david.vrabel@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"hpa@zytor.com" <hpa@zytor.com>, "tglx@kernel.org" <tglx@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "bp@alien8.de" <bp@alien8.de>,
	"oleksandr_tyshchenko@epam.com" <oleksandr_tyshchenko@epam.com>,
	"jgross@suse.com" <jgross@suse.com>,
	"x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH] xen/grant-table: fix resource leak in gnttab_init()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <ceade382ab685f63b90b5bda405363db01f486e7.camel@intel.com>
References: <20261117084325.1241735-1-haoxiang_li2024@163.com>
 <6e3ed5bd9de1764058a257dca9e8fd6ca9fa1175.camel@intel.com>
 <78fc4539.482c.1a1f78783e1.Coremail.haoxiang_li2024@163.com>
 <ceade382ab685f63b90b5bda405363db01f486e7.camel@intel.com>
X-NTES-SC: AL_Qu2SB/6fvEou5ymYbOkfmUwSj+s8WsO0vf4i245fO5B+jDjp1T4OT1F4NHjp+uW9ICG1iDO4agVRzeJlcaxVXYswkxcUb8ZW/LSkWCV2SnAgaQ==
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
Message-ID: <57e13adb.164a.1a1fcd618cf.Coremail.haoxiang_li2024@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:bygvCgD3v6H0PAFryAVzAA--.60W
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbC7RRn1WsBPPS5OwAA3r
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkF0IDIwMjYtMTEtMjEgMDY6MDY6NTgsICJFZGdlY29tYmUsIFJpY2sgUCIgPHJpY2sucC5lZGdl
Y29tYmVAaW50ZWwuY29tPiB3cm90ZToKPgo+SSBndWVzcyBzaW5jZSB5b3UgaW5qZWN0ZWQgdGhl
IGVycm9yIHlvdSBkaWRuJ3QgaGl0IHRoaXMgaW4gcHJhY3RpY2U/IElmIHNvLCBJJ2QKPnRoaW5r
IHRoaXMgd291bGQgYmUgYSBwcmV0dHkgbG93IHByaW9yaXR5IGZpeC4gVGhlIGNvbWJvIG9mIHJh
cmUgc2NlbmFyaW8gYW5kCj5jbG9zZSB0byB6ZXJvIHVzZXIgaW1wYWN0LiBGaW5lIHRvIGJlIGNv
cnJlY3RlZCB0aG91Z2guCgpJIGFncmVlIHRoYXQgdGhpcyBmYWlsdXJlIGlzIHVubGlrZWx5IHRv
IGhhcHBlbi4gSSBmb3VuZCB0aGUgbWlzc2luZyBjbGVhbnVwIHVzaW5nIGEKc3RhdGljIGFuYWx5
c2lzIHRvb2wgYW5kIGNoZWNrIHRoZSBsZWFrIHdpdGggZmF1bHQgaW5qZWN0aW9uLiBCdXQgaGFy
ZCB0byBwcm92ZQp0aGF0IGl0IHdpbGwgaGFwcGVuIGluIG5vcm1hbCB1c2Vyc3BhY2UuCgpSZWdh
cmRzLApIYW94aWFuZyBMaQ==
