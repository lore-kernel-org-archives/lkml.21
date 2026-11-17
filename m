Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794940029;
	b=ARE0R5aQ1EQgwFQ/psGhnpLbuRH63UA8Xxl1lHK/WaFicj72/+y+8Hg3+im2jBc6dpqD
	 9Tlr3t9r/S3y9Let6ETdxIbGcCfoxnKdEkt5oPcQDXoJijLnemOv274UcHrUTbITIKtkn
	 +CaNf2JBMGyfBpy6KLsWjZwkD0d5TdV6idZEIAnY+fTNSgSELfgo0z1NNnf+c5AlflYNl
	 1HTt11cAVuiL3WPhq/KJEbCH940rOamdjVkjfUYOMmHkpHWNh2QtYJ7v5Ygz51i46AVsq
	 6GhfLJd/KiCOSurm6AT0QSaAKBoYc2ueqkBw/Fv5qbgh+aq4WVSxZPykLYIcCglYY4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940029;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=IHGGTFZobv1iT/PsDsBHBenkuJx1x1SDwBmqO1o6sWE=;
	b=SvONXn2gvUTBMf5joJln7GoZ56+w0/INPlmBFxoHgKd4DzaxDYHKnlvqXw4MVT2TAIm5
	 XAak6ECGdZJ+NxWVjKtWVjNjkw12DAyWKV4Ih/Uh5TqagHYnsoPkL14GaloHpffc1ampF
	 A0wE2CGyn5cxoCUvTmQAEO4H52r8zMI68hWrxW1NhdyC5tFU5KKq2tt8bT83V9PxJXXHg
	 cqnIyRWZ9kKqpgjoU1BZ2m3o6PD6JCVEJpnZKr8Sv2P6tBQ0TXvGJCqhuaxnCsRWRezti
	 7YarwwFOpOgkC3KsRW8vOLBxBwrTS7rJ6STvq1QC5SEAXX1JXfUkWh61WcvJFFmdyHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EB+d8dAn;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE21E606A333
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:27:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE21E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EB+d8dAn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794940029; x=1826476029;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=7wm6vjR7BOVQRu+HnFqmDLCdRh+vU1QB86P+b1oNffo=;
  b=EB+d8dAnPYorWiYXAwT8HV0dMfjQPThPkw1J/m+/75gUDklA5Xx0UgZf
   yvJmnkY+nEIerL0FbBPEBuvMBGrpw9i7ZaLPqIdQdcZFZ+OQbSUn9gujk
   4IlOqJrry8avQK/Syl8W1vW7raRJXtr7/jzvpyliKkRjPGQarSQpzOUys
   2XcwhFOzPWjmHy4w+gJEQaM4ag2mPfd3GVcfrhyQkTIvIMj0D/27k+ChN
   tfRXyB8RWNYK4XbtIb+Ak9OzdAFlDOvi7ExZANnafuGkQlx2w4uzxEpfG
   oDwzwJMDANAmOXnFIKrocdIxXoqP2JqvAIZBGAI3K724Ezb61QRzGLhVc
   g==;
X-CSE-ConnectionGUID: ObSyJ9sOQTmyMWP6xyf15w==
X-CSE-MsgGUID: GegvjMn+R8qjo3t4lFgfWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3625115"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3625115"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 10:27:07 -0800
X-CSE-ConnectionGUID: VkPUQPhaQ6SKMJlobXYUNA==
X-CSE-MsgGUID: hVS6978ITQOrwU7ffd8wGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9755680"
Received: from unknown (HELO [10.241.242.245]) ([10.241.242.245])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 10:27:06 -0800
Message-ID: <1989e04ee420925b88ec5f17c6fbd11f06739ffd.camel@linux.intel.com>
Subject: Re: [PATCH v11 1/2] sched/cache: Reduce the overhead of
 task_cache_work by only scan the visisted cpus
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Luo Gengkun <luogengkun@huaweicloud.com>, peterz@infradead.org, 
	mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	yu.c.chen@intel.com, kprateek.nayak@amd.com
Cc: dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, linux-kernel@vger.kernel.org
Date: Tue, 17 Nov 2026 10:27:06 -0800
In-Reply-To: <e2a78b9560fc0a232f3c7bd21e7d9738c5915ce1.camel@linux.intel.com>
References: <20261111110409.1498035-1-luogengkun@huaweicloud.com>
		 <20261111110409.1498035-2-luogengkun@huaweicloud.com>
	 <e2a78b9560fc0a232f3c7bd21e7d9738c5915ce1.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, 2026-11-16 at 15:38 -0800, Tim Chen wrote:
> On Wed, 2026-11-11 at 11:04 +0000, Luo Gengkun wrote:
>=20
> Nit:
>=20
> subject would read better as
>=20
> Reduce the overhead of task_cache_work() by scanning only the visited cpu=
swh

Typo.  I meant

Reduce the overhead of task_cache_work() by scanning only the visited cpus

Tim

