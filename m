Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795342091;
	b=cjjMKcQ9qKtawpcNKHtQ2TAGsISLcN+nDC806PwGM/ZGFOFa+K16LMTfaz+9ueKvMxlU
	 +iwYB4kNJIXYRw/kteSNhBBpOf4sFMgD1B9yISkpPC95rW9Tii6nTGjBpq0SjYPdOCDc+
	 YXlb4/IoUgKcaqaorSJ0r5DzzVoQDypbjd6ExWmQarM7gDukFd0KyL8VY06vKhFvwlhMZ
	 XHeLUF/XpR0xu7kWu6HLET1v1S/OTx7QsuDR4N5nGvryappdrUi4bqDIAd8mh7O1XPRFh
	 l0W6gYThpoE+0RG4NXOtlWlpjwMpCKlC9dkijvve/QV+lB6qzwIJcyBgGJ8/uwf2mBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795342091;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=egF/b0XrxAn1ts7Isj8Iu+j0r+ysO1k1OHUcpzWFCjo=;
	b=wxoVpENFwWJsTzMEc8tqzwNm0LpBenpd3Pvr9tYSUV5awXhzyOFR70NBAgPN3nvZm/8K
	 tc52x+IqkpX4PTJ0gmK+7yB4HHtnyPshYd6WUBOeR/cYky81ZBauG1U03j4+1uRjso1d5
	 YNBXDV9+uEXe/wVJGbi4Wun7BB4jbWc+PvyuFvQkIZkGgUiwLxT+qrGrTDFezRmnRb4W/
	 0JPXqnvsTpnanN9TJxl36tOSQPpL6j6qLOaU0ocBC3CEcpLe9agXv++GlKzmErtBwfMpR
	 XO8SZK9hj8ND1S1MmrHLMmSQBrB04TF4Lvti+AnymxqiCKT7avKjjt4UrGiJre57G6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=NjlZu8y2;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F73606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:08:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5F73606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=NjlZu8y2
Received: from eig-obgw-5007b.ext.cloudfilter.net ([10.0.29.167])
	by cmsmtp with ESMTPS
	id UzgKxpCSbV16IV4UTxh9U5; Sun, 22 Nov 2026 10:08:09 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id V4USxWzL6xqjjV4UTxyaKJ; Sun, 22 Nov 2026 10:08:09 +0000
X-Authority-Analysis: v=2.4 cv=bZxrUPPB c=1 sm=1 tr=0 ts=6b02bf09
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8
 a=PFCYaXOscNU-RV6WzkIA:9 a=CjuIK1q_8ugA:10 a=7RSCp7fvD1wA:10
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=egF/b0XrxAn1ts7Isj8Iu+j0r+ysO1k1OHUcpzWFCjo=; b=NjlZu8y2feg8bE2w8v5NEWYFQx
	xvETgBJi0NT8F8pndiPDvAo1ZG6ucvXK5+Nge+NBmh40YoxlqI6DZ4wy1o0ngvKkP3AK4/PBm3o85
	b6HxdOl8pKd3XMkVxd0sJHJ0hglDYLUHb1Z98qTmtapgKdCYVbkRNffThgjhhoxRi+4XS97D08dVT
	Yb/BUqsBY8ZMBOimoRQk6Pp/igHVnFUbNIPcfEqWi7maNRQWSiswlZHNt5xcnGXn5+Q19P6WO+7Jz
	DbWKa08qtcMdoBYEJoGEg400zQ3iIdhDmiCiJnvA9L5tuZAZiFKzDGyMVhLStu2P5Gxo63PYlm2+R
	jtxHAoJA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:36998 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xV4US-00000004BEP-2btM;
	Sun, 22 Nov 2026 15:38:08 +0530
Date: Sun, 22 Nov 2026 02:08:07 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Artem Novak <artem122novak@gmail.com>
Cc: wim@linux-watchdog.org, florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-watchdog@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: bcm2835: add newline to dev_info message
Message-ID: <7ec5f7ac-0ede-49e3-8f2e-4ac5a04ec806@roeck-us.net>
References: <20261122082943.173681-1-artem122novak@gmail.com>
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
In-Reply-To: <20261122082943.173681-1-artem122novak@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xV4US-00000004BEP-2btM
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:36998
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 10
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfBSi7+X8nPTTj+VMz9oVRu5g9Fg4qeO0cqYctOkXQLgXEF9WpujuZzCP7t2ZlrL+4vOCPB7mI1cZyoVFXZOkYKoUSpW5EAA2G9so9i8XITot7/fc9Tob
 157ZU9ZfmL8gionBgl8tQOaqMdpiAOXSW+Ebm9Dc+w4Nrfvam4y8FlXtVF4koulKLSD774q0z29y9moG23njYcT8/J5fRWX1NRkTzX2ml5wSWkfNRs9cS+sA

On Sun, Nov 22, 2026 at 02:29:43AM -0600, Artem Novak wrote:
> Signed-off-by: Artem Novak <artem122novak@gmail.com>

Checkpatch says:

WARNING: Missing commit description - Add an appropriate one

Guenter
