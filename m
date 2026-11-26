Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.130.44.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795671670;
	b=ijmpJQIwUqOXLAJturovHBRzfs1F3LW/sKCK7en9C7MCc7a1a1sj8L1ITefBrGgHDi5E
	 r+RY98wbftocG67b1m/uK5HNElqdS4lTRrSdwKW0ISTrlRn/XUP2/CrpA4mzTrpZ9sG+y
	 etfLeZa37OTsUBsq1KLd1XgdQgxsCiRgGWC1sKqteqkUHlHSpKAyOFWZaivOa58F1Jmch
	 Lp9KxRXhEXgiwSeesxzTkJ18X7FQret3+IpOVZ3hlTMlhEEb/lRpWnvjiRSUrRpQyrSXC
	 5aeoGQH6MJhBOb9kaIVYI6tpx0pZGyQW9CeDeiYV5ZLKOi/zxA1JG40xqv1gEn9puGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795671670;
	h=DMARC-Filter:X-MailGates:DKIM-Signature:Received:Received:Received:
	 Received:Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=1x/yCGwUTOy+R2m4ASJHkBf1KglrwXR6cG8BdArpB2o=;
	b=ihOv3sttywcxuXT0Cb3flS9KO2xD63sKIwxFPw/DEMeEHgsQBNmjoYtYChD0QEb+/2G8
	 dkYD8GDgkdqoW9oEvD3FlvWQW7lpoqID0xevhtWQVciXykAoEHmoSBNcb9DiFFDH+JVcn
	 +LjzwJE0qlroHJlwDLU9x+Xyglqrz+B6JjLRRc7lKyptZOrFdvMi8iugwlZlfAiEvHGsI
	 EYg2cJCwYSXX2LZs4O/rt8/4vUk2txmsa4FxSMSMNpO6qA3afrB3mcDXOtgHLLvgjptl3
	 iWuaC0kJ+SBdP63e/bOhDABtp2my43rMxyldQYFh0wOoAE0Ghpy0eWUI5ozvmCvxulA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=richtek.com;
	spf=pass smtp.mailfrom=richtek.com;
	dkim=pass header.d=richtek.com header.i=@richtek.com header.a=rsa-sha256 header.s=richtek header.b=N58ahHwQ;
	arc=none smtp.remote-ip=220.130.44.152
Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D04B606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:41:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D04B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=richtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=richtek.com header.i=@richtek.com header.a=rsa-sha256 header.s=richtek header.b=N58ahHwQ
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1795671661;
	bh=1x/yCGwUTOy+R2m4ASJHkBf1KglrwXR6cG8BdArpB2o=; l=977;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=N58ahHwQX2JmPEP0K3mO7O78KGdvM1MZ4XCuUnGAHtDGkk31Uhy0pJ4v76IWFHvib
	 Y4U5JN0j+Y0+I5wdFb3dtfS1yYa3lFMI57G3y9k8+ftuMrNIX87VW+1v3bPleUC8kp
	 1SI8QZVt9hrd13taoPXe0KSQS5q1BGGPQB6Hfl84nrrvbXuJTCFfUfGaoBSD0CQOBb
	 8Jsmq2frQ2dr6qWSlOhALeVX6oi6be9mXagOsS1Wx2eUXVPns9zQRJNj20Z/IQ00/f
	 8LYF2DZOX8hnjSzOC7zb/cm/XOuHtW5PhKNEqN2aAivviOR9DUTTMqpdH2yxvtUBc7
	 CiQcSlCmKnipQ==
Received: from 192.168.10.46
	by mg.richtek.com with MailGates ESMTPS Server V6.0(6655:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256); Thu, 26 Nov 2026 13:40:46 +0800 (CST)
Received: from ex4.rt.l (192.168.10.40) by ex5.rt.l (192.168.10.46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 26 Nov
 2026 13:40:46 +0800
Received: from ex5.rt.l (192.168.10.46) by ex4.rt.l (192.168.10.40) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.26; Thu, 26 Nov
 2026 13:40:46 +0800
Received: from git-send.richtek.com (192.168.10.154) by ex5.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Thu, 26 Nov 2026 13:40:45 +0800
Date: Thu, 26 Nov 2026 13:40:46 +0800
From: ChiYuan Huang <cy_huang@richtek.com>
To: Cong Nguyen <congnt264@gmail.com>
CC: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	<linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] leds: rt4505: Put the child node reference
Message-ID: <awfGXumwY62Z4UcI@git-send.richtek.com>
References: <20261125130318.2590336-1-congnt264@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261125130318.2590336-1-congnt264@gmail.com>

On Wed, Nov 25, 2026 at 08:03:18PM +0700, Cong Nguyen wrote:
> rt4505_probe() gets the LED child node with device_get_next_child_node(),
> which returns it with its reference count raised. The driver never calls
> fwnode_handle_put() on it, so the reference is leaked on every probe error
> after that point and on a successful probe once the device is removed.
> The v4l2 flash sub-device takes its own reference on the node, and the LED
> class device only stores the pointer.
> 
> Drop the reference with a device managed action registered right after the
> node is taken, so it is released after the LED class device that was
> registered later has been unregistered. leds-rt8515 puts the node of the
> same kind after registering its LED and flash sub-device.
> 
> Fixes: d9dfac5419d0 ("leds: rt4505: Add support for Richtek RT4505 flash LED controller")
> Signed-off-by: Cong Nguyen <congnt264@gmail.com>

Reviewed-by: ChiYuan Huang <cy_huang@richtek.com>
