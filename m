Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795131265;
	b=OIBjxYaKy+ctoPdKLRVAxh/pZ9qQNSOyVC3bCPkYA0gg37B7JKHyO/3kagFtInQoCaAP
	 /ebMOupM3/d4LRmQyTKQ/+Xcn5tg8KCzN4Uqe6M1WQBViqrs6OXsGx3c1PIgM0YAzixVa
	 4QXHKqkG8l2DCZ/rWfbCv4nn5Nm4nWHEfRltYOAmoduFhOUCtBz+btGBwKrwdkLqw+Is3
	 QgkHAmLfHetqysb6oH1tqJDnaAF1WO3sGA5SLUeNC2hRGGHGSEhzUbI5RooIuB2TrJ4UT
	 laY1p5PdnT4gR0jlBO/Z7zafHTXaGT8YVHn5dSHjQ6AIhcgHxCNWdv3tKvAwDWt6g7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795131265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=MI7mnbWJtqOFjuPsaAZSAnv0rdseJZ3T3cjclMQcElI=;
	b=XqO2FT14BRA6EY+UQkxAuDqx+sOEdFIwd+iuaLzOQgrldcdckE1+bTkUo/71NPm6w0gr
	 IOe0zEOhLvUp+tvE9/LQqOUITrtiA68W83YenTYNbf6L4kNPNQpKuAjOrMaCWIa8JXsrD
	 CpH2tbH4GnpdIR1ieAu43DXvhCMKEsVkb4vosHCjIRsk+OcqZ/k6VdkDUat3G8/wuisX0
	 zi9yUsvTDSYnMuWdONra1WG8ZieOVMbDOAZJ9ceAViChDor34Bkv7HNYnFwuvdXP79yY8
	 9kEGEiEeud3hRwlSrKNlbDrA+6wd86kSpwtWsO1SjRmGlDREekO2UM38hUbOK1HmrSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="Oxm1d/Yy";
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099A3606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 23:34:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 099A3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Oxm1d/Yy
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ed0890476fso1651785ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795131264; x=1795736064; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MI7mnbWJtqOFjuPsaAZSAnv0rdseJZ3T3cjclMQcElI=;
        b=Oxm1d/Yy+28cDfMvo3cUdd6Q0KgD2KJbd/1W0J7vt+MiDkUiRqER9fvsEzv+rb0YQE
         7lgbjx9EmSH8g5MAOeV/k5k30wfsdCtNgmcqlomxqYYO59GNzlQ1QPZ7U/CLX2NjTzAG
         OLDWZLAaLHaYBg5cUxZ6LPDpgdcA9ndXwY/DH36hSxWd3KBJzaBgMu3G4qSQFI85bRAg
         xIK9VYJaXva8sAgtS5LlOHC5YgOBfjnTW+TLo5r3Ad5gQatczb+5QUKf+9GXAFT9sXE5
         tzcGPTQ5O6Ax+i2Xa9TTQE55/BvYvkCErY8E+r7i55kE0ahKFGrMQiD0wrtQhYhwhrzc
         j6qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795131264; x=1795736064;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MI7mnbWJtqOFjuPsaAZSAnv0rdseJZ3T3cjclMQcElI=;
        b=QPh8tS237gWHHlJh+8hG3Qc+YuDSFM+CTN5NvgWVJ09edKupkcaW/Zrqro7CtISKPG
         +DXcYaSv4+P49mOAjV8iBbZJq0ZexhdlcAsHM5ZMb20l1zy3/6Ax8mzJurUf5ENTlfRp
         KqoJExZBm3Et/IVf6oHe6CRhj6+1SqK5j7BLI2T7oML5vFuZ7xJC8wp8y2UOdy+Z0xEI
         DNYHX3b1a6PNw/uXJIzwUR/Xt60xNvJrUXMQSOb0oZii6znmsiA1ggP/bqLeqylhkZvE
         waWi7wQ7GOXqwss5bBT9869Qtr3Q6/91aAyY2GevgZilwnopAsD25mgyla72oSQV95/e
         YdsA==
X-Forwarded-Encrypted: i=1; AL+hErHx3H95AqCl6W+NmcAXtWZYBMfNHkenPatNWRBne/klOwtyQFY0NAXRgQtb0J5CD1teNgKb6y3MuVeWht4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2W/Flh1RRFTHr5vMX9bY4H/8+IA4xrpauI6h4pSJ5FG1+tmOx
	loYnQSP4RliK9LZp3YWiiY+wuvJSBl7m/iB6egLO6X2DA/fLuSJ6QsBz7DlKQC9VRS4=
X-Gm-Gg: AZFdTZfgkEhyS40u2VVbqKAuSDmFL9tQKT+OIgEELPjeZdkq0hSLaOp+QZsU4/W9pzl
	pn2j+b7WrkDppZzvAh1uTxy6qEh/Gj9mOIxuhH9lmd390XohiavVRz2J6JZzH00vuijt5HxIRam
	vQ54pCiqicGR8hyFXKnJeKGW9GemxLgxzWjuBJH/u9mI7R+UNRa5ESlhnkUuasG2VucIpR2yfUk
	W3wPk+z0zp08AXBlB/FALWHzWGeu1Z5E+b/dj9Vn6mDUBVRZ6L2V6gFy4cF4Ge5yek02lsgNsJX
	nguH0dKY5ft759RSU8IKyZYitHqGXXgKVuHsN65qPr39VFFaNd2utu6JcbRSUg1ZmwWsoILXZxi
	Gvb8ouPKhB/Q6LE0Cr7iBvCQNMIq1mtyqPB8wovmnMP3ChoZ5uLt/qwdJN2MnASp4WKtAtTsO8D
	YC/mdLxSyiu6BwXKEL++caqdu0i/ik5cSaAfbnGqZY0H207feYnVmNCxAx/Wtq6d2ByzumTG0SY
	pE8yofhvp+t+iAEDM51hpMcW20hvL7wpazs1Yj3GHFNM4mPdubqmHDESErHulIU6weBjCxdjcLk
	W3RAWfamULyfVrGik/i16t7voO7DjnF5hStQ/Hmarty4K3XsSWdIjX22wUF//eai
X-Received: by 2002:a17:902:ec8a:b0:2f0:446d:30cb with SMTP id d9443c01a7336-2f0446d312emr3115195ad.15.1795131264280;
        Thu, 19 Nov 2026 15:34:24 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:47::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0dc0f8sm5686265ad.27.2026.11.19.15.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 15:34:23 -0800 (PST)
Date: Thu, 19 Nov 2026 15:34:21 -0800
From: Joe Damato <joe@dama.to>
To: Jakub Kicinski <kuba@kernel.org>
Cc: tariqt@nvidia.com, netdev@vger.kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	horms@kernel.org, linux-kernel@vger.kernel.org,
	daniel.machon@microchip.com
Subject: Re: [PATCH net-next v2 0/5] net/mlx4: TX helpers and deferred
 doorbell fix
Message-ID: <av+HfZSa40OFtF+M@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Jakub Kicinski <kuba@kernel.org>, tariqt@nvidia.com,
	netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, pabeni@redhat.com, horms@kernel.org,
	linux-kernel@vger.kernel.org, daniel.machon@microchip.com
References: <20261117155353.2250540-1-joe@dama.to>
 <179493106742.3291.11434436383058043225@kernel.org>
 <avyELebAXqr4y1Yi@devvm20253.cco0.facebook.com>
 <20261119143852.3bca9000@kernel.org>
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
In-Reply-To: <20261119143852.3bca9000@kernel.org>

On Thu, Nov 19, 2026 at 02:38:52PM -0800, Jakub Kicinski wrote:
> On Tue, 17 Nov 2026 08:43:25 -0800 Joe Damato wrote:
> > The only fix in this series is the deferred doorbell flush (patch 5), but I
> > need the other code (patches 1-4) for SW USO support I plan to submit next
> > if this series is applied.
> 
> Not sure if this is what you meant but this may read as if you were
> sending a fix for net-next for convenience of sending more patches.
> To be clear - that's not a valid excuse. That said, here, we're talking
> about a 10 year old error path bug which nobody apparently have been
> bothered by. We don't have space in net for such things at this point
> of the cycle, anyway :S

I'm probably just being dense and not following what you mean here.

I was looking at a local branch that implements SW USO in mlx4 and it was
getting to be quite long with a lot of patches. I thought that breaking it up
and moving some of the patches into a standalone series would make it easier
to review.

I suppose you are saying I should have just kept it as one longer series,
instead?

Sorry if I am not following what you mean.
