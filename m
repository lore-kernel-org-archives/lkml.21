Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=173.203.187.96
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604847;
	b=SHV48xMEbHvgZmtQ1h9UmsI2++I+Jh6GRJ/fjaTM44nl0DtTgB5gqb2dRNQ2+omN1vkx
	 /c0Df6ez2AC++rwAWtrDDxY3y7aBpX8UHOQCSubJgZRv+L0VuC+amsGXgi+WNUtFqS/Ss
	 6Vp3RRbTvyqjS6CsKRpoaQZE3tSJbmL/Hg98T5+xTBDAsUkBY5tDlpvwS8skyVJMdL72B
	 MqZVr6XefPQry4IKV2RS1lkJ7h9GKJjfjfHU2Gqxeh9cGxBHo4kW2qJ9qwXuCGptKF+rn
	 4ajpXS8wCRsybkVrqDoLAaEKQAomIBiDNG7SdQrPzPAyd0wokoZu7qV30VTCs+smoHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604847;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:X-Auth-ID:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Classification-ID;
	bh=up3LzUL15KxCZZfOKX8q3BL3Tmt6KXAS1SFvp9Kkvy8=;
	b=FzxMC5MoDwaaCcGBxtARHc8QZVC9s7hcZxxWfnNvGHgULHDaffajxqOLjIQWuyzts3CU
	 pZAXIr+H/KDyzLjbgnrmtpsWaCRZ19EggW+CKAEe6uYjmnvmfcLcpIQV5f9S2dDr+n+Oq
	 VKTTXlVol5nbMX4GqVLlnFkfe/ybhFcwwcCg45rIO5z7cYMXcvYgIC3+3IFA4ZRNW0iwP
	 AyocFLT4Nwc5m/9IjL+RC+W/hQr31DaFVKV0X19zXJ0Z5jGXw12JnykV4EIP5hQkP3bdZ
	 7e+UiH9M/Z18l10rJMi1z2btZzIjiJB3+XGA/+7I1+DM9EcwyZI2hwjbxddMdpqNsjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mev.co.uk;
	spf=pass smtp.mailfrom=mev.co.uk;
	dkim=pass header.d=g001.emailsrvr.com header.i=@g001.emailsrvr.com header.a=rsa-sha256 header.s=feedback header.b=lnh3qpZ+;
	dkim=pass header.d=mev.co.uk header.i=@mev.co.uk header.a=rsa-sha256 header.s=20221208-6x11dpa4 header.b="r2/mcyWK";
	arc=none smtp.remote-ip=173.203.187.96
Received: from smtp96.iad3a.emailsrvr.com (smtp96.iad3a.emailsrvr.com [173.203.187.96])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C737606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C737606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=g001.emailsrvr.com header.i=@g001.emailsrvr.com header.a=rsa-sha256 header.s=feedback header.b=lnh3qpZ+;
	dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.a=rsa-sha256 header.s=20221208-6x11dpa4 header.b=r2/mcyWK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=g001.emailsrvr.com;
	s=feedback; t=1795604839;
	bh=l15Y+NvnCR1KUZH+Of5UjqEn3jomK8+AnYi3bIJDegA=;
	h=Date:Subject:To:From:From;
	b=lnh3qpZ+j6FI9M2QVifDnnQSQ5ygLX9Acvgw82w2fpjM+Dl5BW2wxBcNeVQO8QEfO
	 thFMF9nr5U1ghcTZ+08sbIyvFPNYETB3XKZymy/vWPvj5AwN09NzuFW0wMO+LZacds
	 317zamdfkFobTO3U04FUfkuyw/tTKNy0yK1wvTeU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20221208-6x11dpa4; t=1795604839;
	bh=l15Y+NvnCR1KUZH+Of5UjqEn3jomK8+AnYi3bIJDegA=;
	h=Date:Subject:To:From:From;
	b=r2/mcyWKDGt/U9qffw8P5hn0m+Z06xR7gAnuTSb6jmUVVg2Fp3WJYjrf18IYYFHTY
	 RNKEhmDCFisU27bGEQAp1e29gIe9noUYjzEXju10EPRB5fC6EQqsMoeUXninC0YAZh
	 cmY5h3uBuFtmmo9GabvRb+KEWMUOvZydsL44C4Co=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp37.relay.iad3a.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id 6A3855CE1;
	Wed, 25 Nov 2026 06:07:19 -0500 (EST)
Message-ID: <e0b5f34c-f69b-40ec-8856-489496542a79@mev.co.uk>
Date: Wed, 25 Nov 2026 11:07:18 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] comedi: adv_pci1710: prevent NULL deref in command test
To: =?UTF-8?B?6rmA7KeA7ZuI?= <wlgns2756@gmail.com>
Cc: hsweeten@visionengravers.com, linux-kernel@vger.kernel.org
References: <CA+_3iFg7vCSyuMqpuwLsurXMe23VLoq10ebjkJEiLaaG1tg+5Q@mail.gmail.com>
Content-Language: en-GB
From: Ian Abbott <abbotti@mev.co.uk>
Organization: MEV Ltd.
In-Reply-To: <CA+_3iFg7vCSyuMqpuwLsurXMe23VLoq10ebjkJEiLaaG1tg+5Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Classification-ID: d6a44657-50f5-4c8a-a086-dd9db974d2bf-1-1

On 25/11/2026 03:12, 김지훈 wrote:
> |The COMEDI_CMDTEST ioctl permits a NULL channel list: 
> do_cmdtest_ioctl() only loads and validates the channel list when the 
> user-supplied pointer is non-NULL, otherwise it calls the subdevice's - 
>  >do_cmdtest() handler with cmd->chanlist == NULL (and cmd->chanlist_len 
> still bounded only by len_chanlist). pci1710_ai_cmdtest() calls 
> pci1710_ai_check_chanlist() unconditionally in step 5, and that helper 
> dereferences cmd->chanlist[0] on its first lines (CR_CHAN()/CR_AREF()). 
> A user issuing COMEDI_CMDTEST with a NULL chanlist pointer therefore 
> triggers a NULL pointer dereference. Every other comedi driver guards 
> the step 5 check with "if (cmd->chanlist && cmd->chanlist_len > 0)"; 
> adv_pci1710 was missed. Add the same guard. Signed-off-by: Jeehoon Kim 
> <Wlgns2756@gmail.com <mailto:Wlgns2756@gmail.com>> --- drivers/comedi/ 
> drivers/adv_pci1710.c | 6 +++--- 1 file changed, 3 insertions(+), 3 
> deletions(-) diff --git a/drivers/comedi/drivers/adv_pci1710.c b/ 
> drivers/comedi/drivers/adv_pci1710.c index fc749241d..aa0e56df4 100644 
> --- a/drivers/comedi/drivers/adv_pci1710.c +++ b/drivers/comedi/drivers/ 
> adv_pci1710.c @@ -621,9 +621,9 @@ static int pci1710_ai_cmdtest(struct 
> comedi_device *dev, if (err) return 4; - /* Step 5: check channel list 
> */ - - err |= pci1710_ai_check_chanlist(dev, s, cmd); + /* Step 5: check 
> channel list if it exists */ + if (cmd->chanlist && cmd->chanlist_len > 
> 0) + err |= pci1710_ai_check_chanlist(dev, s, cmd); if (err) return 5; 
> -- 2.43.0|
> 

Thanks for the patch.  All the emails you sent were incompatible with 
`git am`, so I have resent it with my "Reviewed-by:" line, and have 
added a "Fixes:" line, a "Cc: <stable@vger.kernel.org>" line, and my own 
"Signed-off-by:" line.

-- 
-=( Ian Abbott <abbotti@mev.co.uk> || MEV Ltd. is a company  )=-
-=( registered in England & Wales.  Regd. number: 02862268.  )=-
-=( Regd. addr.: S11 & 12 Building 67, Europa Business Park, )=-
-=( Bird Hall Lane, STOCKPORT, SK3 0XA, UK. || www.mev.co.uk )=-
