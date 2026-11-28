Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795873228;
	b=3j865BctqPlrVj5E0ON3E4S4lSt0RvkHDH44FJ/S+LX0qT6F8H2m9koUr98o/owtKqeq
	 ljm9I3373Vj48L+xn3vr+ngao0YGC20Ll4Vs87v4okYMb2xeu/V2yiFl4+bt10dzRO6rX
	 T01pp/eqjC6SUf+kgBy60X2YR9V3GX1EWbzbrlfe0bWr9I1LgV/cnDrSdj0/c7YG5+amt
	 0KIrlwsR5S+Puc+G8473xiP4yqfhh9B4e4pFdr9enS7rpWhHA7JMaFMFPE6sx86UrXnae
	 nfx0KvKtnDFoOcBcIeIb1uEbEPND0Nat7BUVW6arJ9+QntTHoSqBM7taHoP81XESkBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795873228;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=QyFV4pisqndkw4NPxkRB4pgaLfPMNmkrYfYabK5Jawo=;
	b=ni3f7ja/PlLWkTubyNmivzOuqZ7pqMvsCcxFTijniSyas7mnayAz1jwOt34y84sjev7j
	 xyq6o8mdC5Fv/xY5Sn4tyI6HOHBaq8QUKrhVoOFkPt7uT13b6cl+p/K+mryi0AzClj8Fx
	 5r1fZdDBV0e/0v73Zfik3KE6DWCjKmv8gZhZq49fubvkMMRI6tPiNzsJpXbaD24F+Glmc
	 RFzT+6s0CZmOFhXoqGsYDVLKPBIcgAVzaT2Yo9Ol+r1lXaT5A3nrlHXd+Pn9JA3kV8edH
	 2uH7dCJ4IvVVZQ3xhp/suzC2TMQszJz/OyTk1+KxVR8YDotPg7XyztqcSsf+euBv2eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hyy8BE7T;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11996606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 13:40:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11996606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hyy8BE7T
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso110045395e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 05:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795873226; x=1796478026; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QyFV4pisqndkw4NPxkRB4pgaLfPMNmkrYfYabK5Jawo=;
        b=Hyy8BE7ThnPiEgCqVkJoKTCxCsy9TFJLNY9Xbv5dw5e02Rrpqietxr4bgIIee3ira5
         rGlIml89ZGFsNTqero2ajm+P+6KFgWdpvWDgVIFUsHkWV0YSOmP9p5IOi2uSFZzhWhVm
         4nkF3R9OtX/3U/3Ihmmu5ZB/MyM1gM5FkALLdcX3396e+lJnBqGDreoTxX+tG6rBwIS+
         TfZwdzqLM8QkLn++l+YSRlYqIIHk3mE16+ggxqn9QxL9vyuEw5m5IiM6gtjF2c3eNVJo
         LDE53a/PCBf71+FrgEJlYOD5cQ+dDSMbgoMdK+qcEWZC9FXSeY+U4q8+AD4eeWjhEjHK
         oN1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795873226; x=1796478026;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QyFV4pisqndkw4NPxkRB4pgaLfPMNmkrYfYabK5Jawo=;
        b=zruhDj/RK8o37uDBXmWvKjUPYFQIHEZ4HNUkCDGt6KXtrw6maGa7OdBVdOoh3WK+3K
         Pf9aWp7hXl6HR78n1t5SpBL01XaGtYWbcZEAup7/YP4rfExzS7/6nvKIbFO1Cb/TdGA5
         Pd+e9eDa6IXqOB0jYCzpj7JvVLe62dgDmuSszXu/c4j+gz8WFN9VR69gVYOFFWRhTNmA
         dEIebaG+Q3Qbo4IK4Iw5qEAFDHuWa4wz9SVLGxx9zB12Qw0E7896MzV8PNM4Dy9CasKP
         kCUVfJLWpCRoCU3e8DzF8SDItliea2FyD8VjfxVYpwua7BarAGCgQJi91S+WPx5y+2js
         GSYQ==
X-Forwarded-Encrypted: i=1; AL+hErEu9Of17E/hNwYvHjQ5m5C1pG6mfHEzK7GJRtYVRxDtekLj4QzOu0g7T4i/pSueLhPPiXvQ53rJKizdBeg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8N/jy8zZmv967dSGg3Wj4z4IvPpai2sdeDXV7lfh1cdUOwS4Px
	iRTqMQ6SMyS4N79Td/1WRrxxFfSG8HkSi0TWsuz9rONfGc4SsDbW6cYg
X-Gm-Gg: AZFdTZdXZVje5qCUmwDqTr/7O8wLYS5N7p9ZU+J2GFcCEy5xQCi2mkz5dWLJwPT0sWp
	hDB6a+kmzUp/ce0yRLc5Rm3bZ2XltTJBX2PZ4HBo7fGmmi8hhOBVJ6XtPyf6g1YzxtOnfTnVd4e
	JfjwOJnQHpjf3qYkXXpCRPjV7Su7DPyHgJ31hqbJj/Dx5XfTt8h7Z13Dh5Jgrq61iYtnYh5gk27
	7WfcNjG2D/n/tHzbgMrundzrVkzpa4bYyrozRHzM0eK5ntGtLhqIJrIVg9A+IBoT4io53/nQTlR
	2TLoBF/ydPvf3v3T/2ZSJwH/0F3QQI+gmHvY442khfQlx6HN5J+5eQPFOCeLoWklJd689LsQnOu
	tW1Z1/sFaHxJ8gMPiNO62hik4Cf7GuEqSY4WhuoH/oFKCEweGP+JRVeAikvzsspgFICkc6yTD33
	5qZSVHIK1DH6j47PW7+r21CXGZXeHT8cTCWUJUm9tt8fWU6RvSXxYCnqe+m2czgFZotAX1dcVq0
	4aO9XCOcTOWXV5N4JGA8qOdZRI3gVKcilvkhl4gPaOXqoyZJKAM6S25ewclImDr/+2FrAR850MR
	6g659Ry1g4brMZFPjpiuZ4a4S60Ufuq7AlxKykbvWov0zY9Nw9+/L6RDuXggZItkwkbDUKXm3vo
	qcUiOs8OIT3iyYaay7xruvUE2Q6hF7F5GxTA=
X-Received: by 2002:a05:600c:4e16:b0:4bb:69b2:d3df with SMTP id 5b1f17b1804b1-4bb88813024mr568205445e9.25.1795873226378;
        Sat, 28 Nov 2026 05:40:26 -0800 (PST)
Received: from pc.tail250202.ts.net ([87.110.86.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm1404838525e9.4.2026.11.28.05.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 05:40:25 -0800 (PST)
Date: Sat, 28 Nov 2026 15:40:24 +0200
From: Janis Edvarts Lacis <janislacis06@gmail.com>
To: Antonio Quartulli <antonio@mandelbit.com>
Cc: intel-wired-lan@lists.osuosl.org, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH net v5 6/6] igb: only allow runtime PM if the device can
 wake up
Message-ID: <ri6pk2cv4qsc3lyumnpskogyadfhhk2aybgwyvbpdfoetkrbjf@efy5saiqmdzy>
References: <20261124235723.1135808-1-antonio@mandelbit.com>
 <20261124235723.1135808-7-antonio@mandelbit.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20261124235723.1135808-7-antonio@mandelbit.com>

On 25 Nov 00:57, Antonio Quartulli wrote:
>igb lets the device be runtime suspended even if it can't signal a
>wake-up from D3. Such a device doesn't notice the link coming back, so
>the port stays down until it is resumed from user space.
>
>Only schedule a runtime suspend if pci_dev_run_wake() is true. Devices
>that can't wake up no longer runtime suspend, even with power/control
>set to auto. Checking it when scheduling the suspend, rather than at
>probe and remove as e1000e and r8169 do, keeps the runtime PM usage
>count balanced if the result changes while the driver is bound.
>
>Tested with the 82576 emulated by QEMU.
>
>Fixes: 749ab2cd1270 ("igb: add basic runtime PM support")
>Cc: stable@vger.kernel.org
>Closes: https://bugzilla.ipfire.org/show_bug.cgi?id=13562
>Signed-off-by: Antonio Quartulli <antonio@mandelbit.com>
>---
>v5: check pci_dev_run_wake() when scheduling the suspend rather than
>at probe and remove, which keeps the usage count balanced (Sashiko)
>v4: no changes
>v3: no changes
>v2: no code changes; mention the tested hardware
>
>Note: igc has the same issue: igc_probe() also allows runtime PM
>regardless of pci_dev_run_wake().
>
> drivers/net/ethernet/intel/igb/igb_main.c | 14 +++++++++++---
> 1 file changed, 11 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/net/ethernet/intel/igb/igb_main.c b/drivers/net/ethernet/intel/igb/igb_main.c
>index 80ae03d..853bdf4 100644
>--- a/drivers/net/ethernet/intel/igb/igb_main.c
>+++ b/drivers/net/ethernet/intel/igb/igb_main.c
>@@ -5625,6 +5625,15 @@ static void igb_watchdog(struct timer_list *t)
> 	schedule_work(&adapter->watchdog_task);
> }
>
>+/* A device that can't wake up wouldn't notice the link coming back while
>+ * runtime suspended
>+ */
>+static void igb_schedule_runtime_suspend(struct igb_adapter *adapter)
>+{
>+	if (pci_dev_run_wake(adapter->pdev))
>+		pm_schedule_suspend(&adapter->pdev->dev, MSEC_PER_SEC * 5);
>+}
>+
> static void igb_watchdog_task(struct work_struct *work)
> {
> 	struct igb_adapter *adapter = container_of(work,
>@@ -5777,8 +5786,7 @@ no_wait:
> 					return;
> 				}
> 			}
>-			pm_schedule_suspend(netdev->dev.parent,
>-					    MSEC_PER_SEC * 5);
>+			igb_schedule_runtime_suspend(adapter);
>
> 		/* also check for alternate media here */
> 		} else if (!netif_carrier_ok(netdev) &&
>@@ -9741,7 +9749,7 @@ static int igb_runtime_idle(struct device *dev)
> 	struct igb_adapter *adapter = netdev_priv(netdev);
>
> 	if (!igb_has_link(adapter))
>-		pm_schedule_suspend(dev, MSEC_PER_SEC * 5);
>+		igb_schedule_runtime_suspend(adapter);
>
> 	return -EBUSY;
> }
>-- 
>2.56.1
>
Reviewed-by: Janis Edvarts Lacis <janislacis06@gmail.com>
