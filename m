Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795516915;
	b=VXH3Ic0HTfpoJnUWW3TAIAKaYODoErk34QpvAuZaVl7SjgI6xQQOvav/YECuzRrkMznh
	 hIh7r/MjHcR9uPf3XzX1/lwjIaUqhOlI8yBgr9KymyBZ9CcrQ5epBE6ibJcd3xAW8JuFt
	 SbsX0INxDwN0FlJIuHjM6qlTt2MMUvk4NGfSKb+kGVQjlbbdVaSnTWv7/kkrd/ZcBr2uJ
	 4FoR3oAaxerpdhgjT9NXFEmZvNZAEbAl8hv1I5VE3D/OZIZXVN2jZSBab2+8YTXKqHGEM
	 02cUpPkAXJ+dxvkkum306b2sLdm1y5DGttIhQoaf4FAZNygZJNAVZdhNo2c0o2SZXPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516915;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=j4tAGzTcAIo+qwi62PnHbYBMkqWMEXmDctAPkjTk5rY=;
	b=AQP3lRmOrHD5o3Zw+AJY7t0twp3m60A+1U4VA7l/4hCLBQJaAyT2IoXhsfsXkMVhcY3I
	 JR5wZzZ5THEDT3wJa9SJNNybQ5jdKZ4Vpvh0cxm/3Yxg9xBGoX6bZt76U1NnkkjBpxiQR
	 5wNooD+PbG92AmNTfQAQeQmHrjFVfti7Vguluvt0aXSq9kKZt3U0zX9W/LQ4wSs6W6AMj
	 LW/zpdU4XOOFG6xBziBQZ1v0ayQkDUoPj4H+5EcGripQ0FaULZCW1SFvV2/6shsG9tFOr
	 R59NgZ1rYuwBbq198+tX4ZbQ81XfuGLuYvfIYJkF3vx8EnZeYW2GLaYak6pk8n1LhPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WDHQkeI+;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638B6606A33C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:41:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 638B6606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WDHQkeI+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795516916; x=1827052916;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A/nB+vVye4yDkj/xDltliE3Ys2sjtI6KmTsgS58y4C4=;
  b=WDHQkeI+GNgTqPS91sfaFQLODzjVI2mEW25mn6voMPtGePfp0MToAgF1
   /w7PH7/VyUKuHzz2LxLw/uUAeWe3PnpEwWySYsoye5Joy2aJHFvViXzg1
   GkBjZEP/nvOWhkqav5XYU/FKMu2Ndzhiw7CcfQ6D4iTg1TPFlsbb9FwtS
   3svg9usGTWM6fqzl6vRzqPrKYTtWLrbMli8N+YsUvWYqkwgKRpsIYmAkP
   FRli9ey4ZHrnr05X++6rpEfAAQhkovEuFCXbgoue57BBL+3+5MRaFrAY2
   vRatcDBn+cm1wkmKir70EpI6bamOEUEXgDwn41RbA0oX9F8ceBzWT5tkJ
   w==;
X-CSE-ConnectionGUID: i9uKR7BqQpmxapskABqw8A==
X-CSE-MsgGUID: DJpIpyDgQ7qSze2Lbqjn6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4248967"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4248967"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 02:41:55 -0800
X-CSE-ConnectionGUID: cv2A3idzQySV4WhxWbuFHQ==
X-CSE-MsgGUID: vQdS5BUiRMGzN1bqin+XJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="11651521"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.125])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 02:41:53 -0800
Date: Tue, 24 Nov 2026 12:41:50 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Petr Mladek <pmladek@suse.com>
Cc: Avi Weiss <thnkslprpt@gmail.com>, Chris Down <chris@chrisdown.name>,
	John Ogness <john.ogness@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	printk@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] printk: Fix skipped entries after index iterator restart
Message-ID: <awVp7h8mZakQy03y@ashevche-desk.local>
References: <20261116085609.476250-2-thnkslprpt@gmail.com>
 <avrJl4lYirh_7oQ-@ashevche-desk.local>
 <awVmsdsIa9niLarO@pathway.suse.cz>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awVmsdsIa9niLarO@pathway.suse.cz>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Nov 24, 2026 at 11:28:01AM +0100, Petr Mladek wrote:
> On Mon 2026-11-16 11:15:03, Andy Shevchenko wrote:
> > On Mon, Nov 16, 2026 at 10:56:10AM +0200, Avi Weiss wrote:

...

> > > -	return pi_next(s, NULL, pos);
> > > +	return pi_get_entry(s->file->f_inode->i_private, *pos - 1);
> > 
> > Side note (because it seems used more in the same form), we have file_inode()
> > helper and this should idiomatically look as
> > 
> > 	return pi_get_entry(file_inode(s->file)->i_private, *pos - 1);
> >
> > But I haven't checked if the file_inode() is recommended or deprecated API.
> 
> Good to know. But honestly, the variant with file_inode(s->file) looks
> less readable to me. IMHO, it is not worth it.

I agree, but I have checked treewide and that's why I put word 'idiomatically'.
All questions to VFS folks :-)

-- 
With Best Regards,
Andy Shevchenko


