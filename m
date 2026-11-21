Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795221978;
	b=GENjnAYt4zUtBPZFS/rUKzMmUrWs7atmH2vXKdXISSzarHv9xLu+PcSUFfrWBXgnZn0X
	 4geaqc/B/oxIlML0yOAn1FDUR5LKQlaFIjaf3fVooXbAfL6hp1sEsxSZizMKA9OVgk1Gc
	 oaDTg3UTJPGQw3iloRGLQ387+z32erMj80E/erXObgW346tB0Qel8hBxpR/N+ELX/TRXX
	 6rkRjhSc0cdiPHRKTiaZQSAq+W7ehtokiEadOshQP7Z94GFSM7mqi/WJgMN2Z5+1iBIbh
	 vVo46+aULj7k8qS7NIMuJ1KkpHxQwdx4U3DzhRY1bfVkekZiWe76NZMF1CNQlYZTrXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795221978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=z1VMRBu/4XH7T+6tEz/5iTEbZBHgIahZjHHLEYkUfCk=;
	b=5Q8MpoMmR6FRzLtGH2LLvH/wvhTIqMtLV+z67VYRf6oURES//HneZgi+BJXujC0tVxWZ
	 gGyEZFOAsEm3HN98uFNJbmn43+2ZcW64ne3WPVDmjkO7Djkr0PCsCTHcEW1CbVGZUdDkX
	 waZ5MRldOPa2iSoaBfocGaG1m8yOv9zarkDFqTnCzQVaYdhklrFIE+C4fcX+6CHutHoXD
	 uJAhAF0y1O7fi8u4XjLd8Nh8T9qX3esEM6LqzfCwc08Bryt8Oa1BOAu/8aHl4H2bpOPrS
	 LWxFUmRtv4GDmaKfyUAwbtLfh7UUmi3/oUGvNSImqSPCs+rG8GzjHnfjIiVfiyYP1oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TfDmv4xy;
	arc=none smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3A7606A33D
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 00:46:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F3A7606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TfDmv4xy
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-92130d3ee15so16124346d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795221973; x=1795826773; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z1VMRBu/4XH7T+6tEz/5iTEbZBHgIahZjHHLEYkUfCk=;
        b=TfDmv4xyzUV54MiRRR3BpbvHjn58oedjubWwX1+IsW0dQnprMyoYQtjWh/ZVYuvzjc
         ExxFXEF8crQTismVXOgrVCHOquvyn0Zxw0rtpljIFRBzEKpGHdNGrYNeGCumcDq73o4K
         3bCl8XLCakX99YqGwuvQtfzpBLPzSrMNdpBhImijuxUeo3iHC7ou+Mgt2k6H0n4ZDh19
         +0nil4ROgCoDF+0aSD9/JkrRYjtJRf3h8Sw0CyMXqMvmekg+OLcfKnHhX/5rKcvBjXM7
         1hZ7Ijrz0Dgyl1fSCBskcRc67v3OS5z3Gk0BGHit1nxSe5F4F2XBQAxdWl0XuMErkM3d
         v9gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795221973; x=1795826773;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z1VMRBu/4XH7T+6tEz/5iTEbZBHgIahZjHHLEYkUfCk=;
        b=P/8V2f6SjWaJfZJz1iSGpHC76ljaTO1TlXhP+4EGgCaz01K1Y1S+F022H0s7vF2zDr
         o1ECytzQ+ggcf5SdZ6sfjAKtCBulKCYVRazUT5GrteLUEtU8qdUnRllUjlpZk1cIdWuU
         jM/MyPL0LsvcKyD+i4nU8o4w5fOHkeqjOZq+zazIDCA6MKXor+G52AvrdW7swRRYCG8Y
         /D3oKyprR6Mq0LS+IPoXY/kftQNJndm3llgs6j9P0ROnW3PCP0VFQqGo5zDQBhRtVIEz
         VNQMaTWvWJRC+EQ7X2xdNx5+DbblEaNUxuKpjJ9qZYxWTz1rmDzC6nQy0+cSH4D9HOyg
         Q6OA==
X-Forwarded-Encrypted: i=1; AL+hErEiFqn3/f6u4FnxbqbUGW7v4mDPHXG7S0U5s4SWJc99mo2/FWfl8R2dC3ho5znJCLRbPzLmx8H86X2vHz0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+k/3M4onWbjbJViRt716F/wXh7p91gwvPRH2zr8a25Dccu6ua2
	WMCreDnyQ6VFomZrEAxng3nqMf5V/+WUdFntXcb6m4KsN0yt5RnZPFaX
X-Gm-Gg: AZFdTZcyxIU440RBwtGmwD5bAFVZvl3w03cnL+BnLkWkG0zg2syhMK8sJY7lHrzGqus
	w+mkwBT6I0Jo+3GoOv87kwCOsJECyY4wqoh73NwAjwXvuNyoIjh/r7XVOpdMm3mqRZwoQEBqIix
	tsj/QvsQGysyPih3Vb95P7u7DAm8w2LMrczF5mMBpjduAs2FAjnQMgzg1QEIMiXtJhlGI/pkesQ
	1UXVyJnoCQq0sSWWhdGeV72lISGbfXRgdsT/N7w7reuri1R0nG98JbKh6saUGvqJjOgIIs5fXDh
	ebIjDWoyY1Wrabue9bxjnoD/25ia18RmEZLANseIgIFCsOiC3G9cF04biCLISXbxwwq5Ti8e1Ys
	MdXgxK9YEwXvG+aAZZlHi6sApj7I+l/OjLjtibVHZopEHRwdLxtXi8kjiABF32ouU7N3iaF3feL
	FQKYLbta1E7AhPvCVLFTqvVI0Apet8n18ZymeE/49iiPMr5HvmXXOSpZhreYaaBuuElD6bpj+EB
	AECxYcXVFc+SSrV6oPTcdG+8uDmgD+Qud+U1Bhx8ry4pWnpJBfvw6KCIrbV9TrBPW3eGIRLNbSR
	9P2SO8Or/QJ8YwS3lCyg5aH5plRVKTpTDA9FXp6CySFsysyj+wxuHj+L
X-Received: by 2002:a05:6214:252d:b0:921:14b2:31b4 with SMTP id 6a1803df08f44-921349cefe3mr81538306d6.2.1795221972835;
        Fri, 20 Nov 2026 16:46:12 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349eae11sm39982856d6.25.2026.11.20.16.46.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 16:46:12 -0800 (PST)
Message-ID: <4dbd83c3-e13a-4003-b2ec-55ab53258837@gmail.com>
Date: Fri, 20 Nov 2026 16:46:09 -0800
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
Subject: Re: [PATCH net v3 09/10] net: au1000: keep the MAC stopped until the
 PHY link is ready
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 hkallweit1@gmail.com, linux@armlinux.org.uk, shaojijie@huawei.com,
 horms@kernel.org, runyu.xiao@seu.edu.cn, mmyangfl@gmail.com, hvr@gnu.org,
 danny.kukawka@bisect.de, mugunthanvnm@ti.com,
 sebastian.hesselbarth@gmail.com, linux-kernel@vger.kernel.org,
 manuel.lauss@gmail.com
References: <20261117193223.2795612-10-f.fainelli@gmail.com>
 <179517076197.3136.575167773294560465@kernel.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <179517076197.3136.575167773294560465@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/20/26 02:32, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 1 · Medium: 0 · Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [High] The fix stops MAC RX/TX in only one place: the link-down branch
>    of au1000_adjust_link()…
> - [Low] The new au1000_hard_stop(dev) call in the link-down branch of
>    au1000_adjust_link() (au1000_eth.c:460) runs inside…
> 
> --
> 
> net: au1000: keep the MAC stopped until the PHY link is ready
> 
> This patch stops MAC RX/TX in the link-down branch of
> au1000_adjust_link(). In au1000_open() it resumes the PHY synchronously
> before au1000_init(). It also changes au1000_init() to leave RX/TX
> disabled until au1000_adjust_link() has acknowledged a link.
> 
>> diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
>> index cb2f3333ba9fd..98a75aba92e1a 100644
>> --- a/drivers/net/ethernet/amd/au1000_eth.c
>> +++ b/drivers/net/ethernet/amd/au1000_eth.c
>> @@ -456,7 +456,8 @@ au1000_adjust_link(struct net_device *dev)
>>   		/* link state changed */
>>   
>>   		if (!phydev->link) {
>> -			/* link went down */
>> +			/* Stop the MAC before the PHY can remove its clocks. */
>> +			au1000_hard_stop(dev);
> 
> [Severity: High]
> This covers phy_stop() on close. Is there a path that powers the PHY down
> without ever calling adjust_link, though?
> 
> During system sleep, mdio_bus_phy_suspend() only skips the PHY when
> mac_managed_pm is set, and au1000_eth never sets it:
> 
> drivers/net/phy/phy_device.c:mdio_bus_phy_suspend() {
>      ...
> 	if (phydev->mac_managed_pm)
> 		return 0;
>      ...
> 	if (phy_uses_state_machine(phydev))
> 		phy_stop_machine(phydev);
>      ...
> 	return phy_suspend(phydev);
> }
> 
> phy_stop_machine() only cancels the work and moves the state to PHY_UP,
> so it never reaches the PHY_HALTED path that calls phy_link_down():
> 
> drivers/net/phy/phy.c:phy_stop_machine() {
> 	cancel_delayed_work_sync(&phydev->state_queue);
> 	mutex_lock(&phydev->lock);
> 	if (phy_is_started(phydev))
> 		phydev->state = PHY_UP;
>      ...
> }
> 
> On MTX-1 the LAN83C183 then gets genphy_suspend(), which sets BMCR_PDOWN.
> au1000_eth_driver has no .driver.pm callbacks. With the interface up and
> the link up, the MAC appears to keep MAC_RX_ENABLE | MAC_TX_ENABLE set for
> the whole sleep.
> 
> On resume, mdio_bus_phy_resume()->lan83c183_resume() waits 500 ms, and
> the MAC is still running during that wait.
> 
> Those are the two conditions the commit message describes: "MTX-1 can
> hang when the MAC runs while its MII clocks are absent or still
> recovering."
> 
> This looks reachable on MTX-1 itself through s2idle, because
> pm_states_init() always offers "freeze" even without platform
> suspend_ops. Alchemy db1x boards can also reach it through suspend-to-mem,
> via the db1x_pm_ops registered in arch/mips/alchemy/devboards/pm.c.
> 
> The last patch in the series ("net: au1000: reject frames larger than the
> TX bounce buffer") only touches au1000_tx(), so this gap is still there
> at the end of the series.
> 
> Would it make sense to add MAC-side suspend/resume handling here? Another
> option is to set mac_managed_pm and stop and start the MAC explicitly.
> 
> [Severity: Low]
> This call runs inside the spin_lock_irqsave(&aup->lock, flags) region of
> au1000_adjust_link(), and au1000_hard_stop() ends with a busy-wait:
> 
> au1000_hard_stop() {
>      ...
> 	writel(reg, &aup->mac->control);
> 	wmb(); /* drain writebuffer */
> 	mdelay(10);
> }
> 
> Doesn't this mean every link-down event now spins for 10 ms with local
> interrupts disabled? Before this change the link-down branch did no MMIO
> and had no delay.
> 
> On close the wait also seems to happen twice. phy_stop() leads to
> phy_link_down()->au1000_adjust_link(), which does the first hard stop.
> 
> au1000_close() then takes aup->lock with irqsave and calls
> au1000_reset_mac_unlocked(). Since MDIO accesses have re-enabled the MAC,
> mac_enabled is still 1, so au1000_hard_stop() runs again with RX/TX
> already cleared:
> 
> au1000_reset_mac_unlocked() {
>      ...
> 	if (aup->mac_enabled) {
> 		au1000_hard_stop(dev);
>      ...
> }
> 
> The delay is only there so the MAC can quiesce before phylib suspends the
> PHY, and that suspend happens after adjust_link returns.
> 
> Could the register write stay under the lock, with the mdelay() moved
> after spin_unlock_irqrestore()?
> 
>>   			aup->old_speed = 0;
>>   			aup->old_duplex = -1;
>>   		}
> 
> [ ... ]
> 

Agreed. The MDIO bus system-suspend path can power down the PHY without 
delivering a link-down callback, so the original fix did not cover that 
path.

I have added MAC-side system-sleep callbacks and set mac_managed_pm. 
Suspend now detaches and drains TX, disables the device IRQ, and 
explicitly stops and quiesces MAC RX/TX before stopping the PHY. Resume 
restores the PHY before initializing the MAC, then restores the IRQ, PHY 
state machine and network-device attachment. Inactive interfaces remain 
stopped, and failed resumes leave the MAC reset and the interface detached.

For the IRQ-latency concern, the link-down register update remains under 
aup->lock, but its quiesce wait now runs after releasing the lock and 
restoring local interrupts. Existing atomic waits in the reset and 
duplex-change paths remain.

MTX-1 testing passed 15 down/up cycles and five device-suspend/resume 
cycles covering up, down and never-opened interfaces. These used 
pm_test=devices; actual platform suspend-to-RAM was not tested.

pw-bot: cr
-- 
Florian
