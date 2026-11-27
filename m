Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795807846;
	b=nyMk+II23sVzET2VvDlTGfiLJ5hue3+RAkuUBarQ4MJqUiD/2qnyyDxdB/us9oiI5ATW
	 D3qFradhR1ZDpn/uYInTtTXw7SeFsV8iyw+AAEf7UzGHJAjTkDyu+3Qts4ez5K9uH028d
	 lPD3Ghsl4DH4JVlrBrfnJ7m3k76V479ofDgwLCeWTkRBDWf+X6oVvCct07HHIOVeQWDpw
	 u9QIfOShh8uII7LFv7hX1JdaWEMoWOz2AmLOHrigi2rVOevG1xhMo9pg/gCw9JMe/p6k0
	 S/8oyXl4I8nWhoFNTgn7KFAZWBSH6CPQ7dEPenKtfaj6zxrFEqOAOt/T7ICkqKIzpLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795807846;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=lV6gzRwYarDtzQev8auyW29aPSM81nbbwEA/Ylkk+YU=;
	b=kKw7WeEQOQ8Nz/JdRMZCDPCPG20u3ntI9B8EjMGBWJRYu45MAsQaV/FMfd99MPFWLk8i
	 ZoFIY8bTpPmZnYNlZhKTPiKFkWBrYQNGirfweneHKvUbiFwPjWcF4NNBTe94wiJSM9Yr+
	 IA9f3bINR6NKk0Hq7FLac8rrOB6mC4YyefACHi8DsrkxZzOkl0VQVXq0GBuyPOsSC/E2N
	 Sp4efIsvQJDPSKmxJ12ZgKQiCSgnRn1KOPPIXD4buS2FXU1FUxG9Lb/L4fK6OWaUmeh+J
	 a3YJH1G8TJPqyCmXf1A3MG2qFdB1VO+e4t0a4A0tAkBwA54vMJPiUJ1ayYvLX6ZMcuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=TQTdSDdV;
	arc=none smtp.remote-ip=44.202.169.39
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A90606A327
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:30:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65A90606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=TQTdSDdV
Received: from eig-obgw-5004b.ext.cloudfilter.net ([10.0.29.208])
	by cmsmtp with ESMTPS
	id X17LxffpWOOJnX1efxkFDJ; Fri, 27 Nov 2026 19:30:45 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id X1eex3gWHuJrPX1efxwjjL; Fri, 27 Nov 2026 19:30:45 +0000
X-Authority-Analysis: v=2.4 cv=WLZ/XmsR c=1 sm=1 tr=0 ts=6b09da65
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8
 a=qfpIj3PEHlP3QdlUBgQA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lV6gzRwYarDtzQev8auyW29aPSM81nbbwEA/Ylkk+YU=; b=TQTdSDdVjwrzxyPsjIFqweLt5D
	VFwXpSNOUTJOvIJmLY0n0gOuWT6FlXTNp9Lv6x0hKSkzMk9DrNmXRjnm/sfCd9e3lqiQlkesVVPDw
	pHqJB1RMMJ6Jo8r4WWMXK5hZ+UariL48oPPW5U890716vzP9ABn01UCcnE2sDDDC2WD0LsOTFBYYa
	oQuj1kuSO2FWgdqk2+odORRQ2JprQuJE5aU6mwrc6nl9gFJGWrwAZw6CKitSOgB2QClMc6SbFnpWI
	LGtR0t49cHnVQE4N7gXpbLa9cPit/LliDJuJfYDpCQ4eUbOBxSM+imfLX6qfEmoiFPqlH8RO9ZbgJ
	tr4h1fIQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:54854 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.2)
	(envelope-from <linux@roeck-us.net>)
	id 1xX1ee-0000000402j-2ocU;
	Sat, 28 Nov 2026 01:00:44 +0530
Date: Fri, 27 Nov 2026 11:30:44 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Sergio Melas <sergiomelas@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] hwmon: (yogafan) Support more than two fans and add
 3rd fan for Legion Pro 7 16AFR10H
Message-ID: <d67c8d8e-89d4-40d9-b41a-4d127ba1ea83@roeck-us.net>
References: <20261127052841.492895-1-sergiomelas@gmail.com>
 <20261127052841.492895-2-sergiomelas@gmail.com>
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
In-Reply-To: <20261127052841.492895-2-sergiomelas@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xX1ee-0000000402j-2ocU
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:54854
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 4
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfASnZEIfIJdEKi9OK6klLm+Q9AH23olx+JfUFSuiIRpNWlLjoumR2+aXoLU/M7j4WYaxzm5wcFgribAZIOHPWFEnEPwNxystI3YtUnkPgQUfwfU5jTe9
 xNiEY04zcTBc2K1dBZlgpAQXmHQ3179xxBH2ZwyiblKikFrrshtMgY9XaTS1whOnDQfi3Z6sMjuFxUIEcml1Vs+rdyltxRvz46jgoY90ssF8ZDJS8cXQPVsH

On Fri, Nov 27, 2026 at 06:28:40AM +0100, Sergio Melas wrote:
> Expand struct yogafan_config.paths from 2 entries to MAX_FANS (8) so
> laptops with more than two fans can be configured, matching struct
> yoga_fan_data.
> 
> Update the Lenovo Legion Pro 7 16AFR10H (83RU) configuration to include
> its third 8-bit tachometer field (\_SB.PCI0.LPC0.EC0.FASF, EC offset 0x04)
> and update Documentation/hwmon/yogafan.rst accordingly.
> 
> Signed-off-by: Sergio Melas <sergiomelas@gmail.com>

Applied.

Thanks,
Guenter
