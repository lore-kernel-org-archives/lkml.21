Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795075453;
	b=mMYmNFrPpmtZQ7Or37dZWqk94kAzW/9zupPbS0SPxaEJMmHSHwsCkQ++aIBaIogW5Lah
	 vMXBfYyECit2cx0fUiF6PppliTx1qTN2fxzPBxUe2Rkdfntig2vAd7d9yJGFcKmm9MRKN
	 bV7J9twfudS8DpQwzu7txKhTzU3aPKXSycdNeoyO3f4kG+xlWIrOjOWYPto3qBURfllow
	 OruRvyia/gVRtdH2SDuLm7FhtVKuiZvUOga/4jI47PCJMFtlgI/OXdYdg9PmYonJzrGV1
	 I6NSxefAhcVvped3s9fC9kElb8vP6A6RBHqrSG66Nmjdtye9RN5uJK/NfHqAEZqoLTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795075453;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:In-Reply-To:References:Subject:
	 From:Cc:To:Date:Message-ID:User-Agent;
	bh=XJq5MA/hKpOGy8y4jxqU4YAJG05jeRxIK8HXfJaOdTU=;
	b=jDK1Q4LSKrEZ0dzUP1IwX36sx7BR95aynbVHcKX3TVQPErUQr+jacFm+kEx+Ek5T8534
	 ijU7p9z/ZG1LhJfxIcMC9fWZYI6M08EVJ39tI+TwkTa8+GJxkgLUkGU8RftRxUAsrgjX2
	 7uLCBemFUqorSu3MXXvrUpWHzywQVLH3SoacQEFurVMc7KBRSbFaTSLA2+kgzSmauJLzc
	 xRxX/nwLoj66uPymuoqX/kXasBf0KKpuxKj0OytMF/PmZf/ipfYPRlauA+/KEscT6M6zj
	 qYnBhb5A6FlwB7+FBgZF0RrykCBszSBiLq9Vn9V11rA87TOeUXjiR6HgNAblkg8Gnqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Xy2q0q8V;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224FA606A332
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:04:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 224FA606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Xy2q0q8V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795075452; x=1826611452;
  h=mime-version:content-transfer-encoding:in-reply-to:
   references:subject:from:cc:to:date:message-id;
  bh=XJq5MA/hKpOGy8y4jxqU4YAJG05jeRxIK8HXfJaOdTU=;
  b=Xy2q0q8V1BvHOaSLVz5Fj5xyo/FsyH3sfkqgKohc3E4xYUgohVLNYFjh
   9lFxbU6zxi+plIB8WWF7hbOPjDhzb6iKohI0dVpxRIrDMVkdJUXg1wCx2
   qpdl6AdRckrCzi0PlgGcxBZUeQvcktjqrxzJV+/agnPOTZMCJNGCTFrxQ
   wGIM/9dEifq+JJmbMGDZbhQ8tOeE/d67gYxZ2oHo/06TrC3A+7MHvm3OT
   ynp3Gumoi8CxEaVc0F7Zbyl2RlMg6d6D2TEAmdDM5dW9m0BBCBQ1nc8+V
   4fIZeBkimOLaXKaRPv9GFKZmJ5LQ41r+P1jSt+iFPFcGLLgXhkB+8ZEv/
   A==;
X-CSE-ConnectionGUID: pHrXNjXJQvCuwmUpCRfqww==
X-CSE-MsgGUID: CbWOf6QeQd2sGR/eE0j8sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3804691"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3804691"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 00:04:11 -0800
X-CSE-ConnectionGUID: 9+IjBIURRrm/QG4eU2eYIg==
X-CSE-MsgGUID: NumvRLGQSam0Z47MQZjn6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10286655"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.76])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 00:04:09 -0800
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261118153205.2432736-1-haoxiang_li2024@163.com>
References: <20261118153205.2432736-1-haoxiang_li2024@163.com>
Subject: Re: [PATCH] drm/i915/vma: Fix a memory leak in i915_vma_pin_ww()
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Haoxiang Li <haoxiang_li2024@163.com>
To: Haoxiang Li <haoxiang_li2024@163.com>, airlied@gmail.com, jani.nikula@linux.intel.com, rodrigo.vivi@intel.com, simona@ffwll.ch, tursulin@ursulin.net
Date: Thu, 19 Nov 2026 10:04:06 +0200
Message-ID: <179507544606.16202.12430112951192190652@jlahtine-mobl>
User-Agent: alot/0.13.dev2+g40c57d620

Quoting Haoxiang Li (2026-11-18 17:32:05)
> i915_vma_pin_ww() allocates bind work before retrieving the object's
> moving fence. If the lookup fails, it jumps to err_rpm, bypassing the
> fence commit at err_fence and leaking the work allocation.
>=20
> Jump to err_fence instead so the fence callbacks can release the work.
>=20
> Fixes: 8ec5c0006c50 ("Merge tag 'drm-intel-next-2022-05-20' of git://anon=
git.freedesktop.org/drm/drm-intel into drm-intel-gt-next")
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>

You seem to be spamming the different kernel subsystems with patches and
never respond to any feedback, so if you could just stop and do something
else.

Regards, Joonas
