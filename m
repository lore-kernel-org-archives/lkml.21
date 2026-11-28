Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795870382;
	b=eBTXzkWF7B7eYshmHQMl9k2/uDjFutkcf6StwffbvNfxTJCimWfYyPSK/ynH4Z48eBKi
	 U+sh+3pWg7ynKYP3MQBCnZP0fEA7l4c1/xN1y418XIJjGIjNc3UAPI3e41sF0oThGFQze
	 DHorMFpLEuMFAmSlzErAK9EcT8EawD8T2sxZ2K5xcwv+aQATrkXA4lSe4xam3eE5teZzL
	 GO/VErorJU/bUdlLobCMMTNo2eMn/z5BYvstXAZuUFkgrGKsNgau3zk6lIaEg0Mr89vTA
	 WMsK2TfnhoHdXgn8ZU+cfTOQ9XCqdvijAEtq0PWAa/lOVJyyjxjxl4LOe1dIISVzRvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795870382;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=h75jUG+PBtMkKHGPbP26Yezo9yQ5wTPIP6PKE7A9i3s=;
	b=znOj6y3cQjt7QX4pMt7YWVJBFl4OsRa4GoZKpYWmh//q8H8pgYTx6fSu8RDKEpK7cgzN
	 GNtQK0+AuXDdsPzB5uYSazN2YAQFfhqXIvrJ5Yvo5YsgxQ3+qwNqo2OAKXJ6YGHG+dVco
	 1aMWW8xui8eJdu7RT5Oa2jfsiqG7iR4Hv2cm8rhL52+pGBBXdGIi4eSkNjReuP4a8pQax
	 VBxjXLew+pjaLC60I4ZX7Dm14g7aPG1jLlbFpg7HjAIQDxFe8JTM/NnwHTh21Wh3hKbne
	 jk6VPhq2I4MmqTBFtWK50fLZdb+h0puh5vUtQyn5qWbUyIpokn9k0xF7EB1ddigDJQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="i57/Xen5";
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BD1606A31C;
	Sat, 28 Nov 2026 12:53:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42BD1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i57/Xen5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795870381; x=1827406381;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=AFKshA39KztF2TJeeGhjaBGYqk5QaWo1qDI3j5Tpros=;
  b=i57/Xen5POCqMURSjVjf0AAr+xYhb3JKBircZT6y/IIRdvhLOPR2O7aq
   zmtgd3z9UnL+J6wF7YvOk6QnFDm550C+eWnBuitdS3r31buESgI9+w2Jt
   e5qCqis6SPTMuuQEHzyh35Bxt1d08O7xoyZigW3Uc1uY3r0yDytDtOHt0
   QZ2G4josYOS4l+mzDUFBOSTwmDwsHnq2F/kLPYp+yGyPJQvhjfjaZT/VY
   R48zrSXbQpHkBjEQeMBrCJ4BCtqvdvGoXVpBfYhKL+PGe+bsItwfdu2Cx
   pzRWYQ7guV6q7lzJOztZEosFNSVJKyRKG8cmiwZnkDRaPshARiOF2kNDt
   Q==;
X-CSE-ConnectionGUID: SgKP3TMXRWW4NwVN5Nfyyg==
X-CSE-MsgGUID: 9jNIazC/SCe+LZsGKQXJKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11980"; a="4774309"
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="4774309"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2026 04:53:00 -0800
X-CSE-ConnectionGUID: VTup8/cGS7+aoG/tpuTumg==
X-CSE-MsgGUID: Tx5/gUxDR266/pEeIbvjHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="12930477"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.47.46])
  by orviesa009.jf.intel.com with ESMTP; 28 Nov 2026 04:52:53 -0800
Date: Sat, 28 Nov 2026 20:42:31 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "Gao, Chao" <chao.gao@intel.com>, "Xu, Yilun" <yilun.xu@intel.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"kas@kernel.org" <kas@kernel.org>,
	"Peng, Chao P" <chao.p.peng@intel.com>,
	"x86@kernel.org" <x86@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"Tian, Kevin" <kevin.tian@intel.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>
Subject: Re: [RFC PATCH 3/7] coco/tdx-host: Exchange SPDM messages through DOE
Message-ID: <awrMNwqLpbCbX8i2@yilunxu-OptiPlex-7050>
References: <20261116111037.3478844-1-chao.gao@intel.com>
 <20261116111037.3478844-4-chao.gao@intel.com>
 <4f832b3a73bfd4d9b74e5e68a08f0de5659e1b6a.camel@intel.com>
 <awV7wYVv4D_Egns8@intel.com>
 <00efbba7a1b2c6e61cc36bf709718da978eec85c.camel@intel.com>
 <awbQpM4QlKTVQ0f8@intel.com>
 <d4783f8c5df1823aabb4b0a1510f52cd1a731892.camel@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d4783f8c5df1823aabb4b0a1510f52cd1a731892.camel@intel.com>

On Wed, Nov 25, 2026 at 05:48:36PM +0000, Edgecombe, Rick P wrote:
> On Wed, 2026-11-25 at 20:12 +0800, Chao Gao wrote:
> > static int tdx_spdm_msg_exchange(struct tdx_tsm_link *tlink)
> > {
> > 	struct pci_dev *pdev = tlink->pci.base_tsm.pdev;
> > 	int ret;
> > 
> > 	ret = pci_doe_raw(tlink->pci.doe_mb,
> > 			  page_address(tlink->out_msg), PAGE_SIZE,
> > 			  page_address(tlink->in_msg), PAGE_SIZE);
> > 	if (ret < 0) {
> > 		pci_err(pdev, "spdm msg exchange fail %d\n", ret);
> > 		return ret;
> > 	}
> > 
> > 	return 0;
> > }
> 
> If the DOE people are ok with this, it does seem much better to me on our side.

I'm not the DOE people but I have some concern about this raw
transfering interface. The kernel manages the DOE layer, the PCI DOE
capability and the discovery protocol..  The firmware has no access
these info. It is questionable that the firmware constructs the DOE
packet without knowing all the info. Even today the firmware can
blindly fill the packet right, no guarantee it still can  as the
discovery protocol version advances.

I lean to not having TDX module create the DOE header. Let the kernel
do it.
