Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703401;
	b=Q0Kd+u5RBjIx1Q39qmkIpunX2r3bDQNB3IuCQmaO1onsdpGv/nQFSh439vmyAkGw6Yx9
	 iImihR2OyssPbMKQ9zh/x7sE+auGr82PDlWKYdgtfaLvPGogCKVhD3u+sTQ7jRdHDmFoF
	 /AAKYWa00aEwn9DzSjI5TXB8S72Mrc1KdSk1lLhlpnCbnl3lXmsQ4lxVrdeitwVm89DMo
	 pzb88ndb8i1USFA5g40dwkgV+7AWvJ/2J4xUp8jdL6ae8yUnxYPXLLw8Zb513eYzzpH2g
	 uY5YHw2JfoO6cm/wrrTxjIBLq2Fq850OsA2qhw48dVtt5zn+B8H79Aqa79HV72nxyEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703401;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=VjqQuEBBQvXUyQLlY4Gl4q1TSfCP6TKWu5ONTcrIr9c=;
	b=gmrVkKOR+dRL+CW3JLLUqwIpnnJ2taZNl9mEgKfEPJkPeTcLySU+D5MF8H405kXbqydt
	 Me/mOB5MrfWw5JoVuxEdFxPy25/Baf2/sB0HU28VfArHaMNaKZirvvydywONNXY1rh58D
	 oFLwOohr1L2elK5ApsI+q4iVPk+VyD8JqRywteD6qQDIbwVBKGXjHhPpTPeWIKo6Zv7qC
	 8qd+b7huMIMCIwZVn396Fu3rd9J+JxsZwAnp9u/C/Y9SDBqypwL4yijLhuSZZPk51kV8E
	 eRTXB9XEHB3dUspuA4k4k8Eosw9wm+nP8uarLgfbBDVAf/Z8FL276x2Un/Rkvjhlaww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VGWouz+y;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE63606A339
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:30:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DE63606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VGWouz+y
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cde7e8abf9cso2613346a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:30:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703400; x=1796308200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VjqQuEBBQvXUyQLlY4Gl4q1TSfCP6TKWu5ONTcrIr9c=;
        b=UaugboMkwZcThNacxZkD9ebhYI0cSy+9FamfhXW0IVjdp8mwsd/vYge8/5gJSNIHwf
         FcIm/M0eedgsrwYrrg4gvtrHB4AuJt2GccuZzbZx5uuchrTHUYT6hY5rH6myJ2PEcsQ5
         DFAgp+id3ufLTXnXR0Zmce2gzgg8Of8Y64jjVYy5uLk3xP7EHZemxKknLSTD5alLh1TK
         L8K6Gpt3bvBB+MHuhfeUpKViid+Zev5p1Fwqzj2+IMOonYnlGkIUoxcrSAcqA/ZCrcmr
         L87s89RY7gzNdO/9f9iZFAoCfz5z/vEkw5XTJ/eGDbW/dxN70myzMAGEuXJ38/mEgQpb
         fULA==
X-Forwarded-Encrypted: i=1; AL+hErHqGJLNtbflQz2a572sJLxxvHAD9uSRNcB/6CKibP1/fhBCm83VqGkd1dfFz4w6In5vNjhDC2oxYz8aU44=@vger.kernel.org
X-Gm-Message-State: APuU4Z89MvXraPzcUojQ9pO41AlavjY1I8kgLJJ/jWv7mRikxIGPnnI7
	PcXEHdq4B05Gk/OVhEZnv+DUkte6Zc2puTRuN8mv1QwU19C6MO6MJKFu3DN+wXTdAi90MR8iGgl
	Kr5iE7yfYJ0h1aeSKjGWr+cndWhdkuFgEEEfRkHoqmCCTzvmlHrDYu2Zlqa/7bP9yraLZp6OU6H
	SZlrp6DdUT/Daia0rvxOPYy+ZrA99GDesnIuC5Qmnc6EKRN/h/1ffXHNESxiyg2aZ6xOxxO2QIK
	W/UQEE2T4nS5Bu/7Ua3uMez4w==
X-Gm-Gg: AZFdTZeSMVcGR5/hbpzN/krFa42pgbILmVYfQz4/HYEjsMPlo/kOmylRrZTkDTQpR6l
	AN8pk5Dsj350d0ocrRrWZovUG230F49yKgBCkvPJmWPcWsvjSy9KGC+EsO2EccBNUvoDmTE/mz9
	ziB8GSQa+8eSedDVtDXBqrdFhRu+bc1YY1T0xmQIUnKcF7D6N9wz2ipn6Q3LMDZIR416JfJMqfK
	kkfGhp06IAPJBcsxxdVQW8q/I6E8eXktc3OKq2wh7LI/NGWyrezHLtiI6ePG3zbpC0NxzuRc1jn
	7+PFeYJAvj+rsTPjMZ2Be9ENp5f5va4tH0bU/IGBJemMIA44mGbkQbFTAynf8v5UiWsI4u+OPb9
	IQdOo2JAxlYZySvmTQm7RcjJJzPRa/HO7umYdvZjPm+f6oJrMqYjHQfRCTmYjz8bh8KzE6dXg3n
	FPjUjno/DNHF28knnuJb4uVHR5BiA3g0rbPapSvMY=
X-Received: by 2002:a17:90b:5109:b0:39e:21a7:5df5 with SMTP id 98e67ed59e1d1-3b41c92ca38mr20090533a91.24.1795703400478;
        Thu, 26 Nov 2026 06:30:00 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b42005a1a1sm14476448a91.0.2026.11.26.06.30.00
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:30:00 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9213730b07eso115912526d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795703399; x=1796308199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VjqQuEBBQvXUyQLlY4Gl4q1TSfCP6TKWu5ONTcrIr9c=;
        b=VGWouz+yeFLq3pLDdz3hhgLFfdlHCRWVv7L1kdTx1owYVDB1u1/xS/vJrFLmPWG1AU
         Tg5Pf5ss2f4dOMPVxAO235iME/bEQ1daezkDeaPicnXrBnOsiUUFfcqCIkuJhIoBh2Nr
         RSl3aYcuAPJi80/qsZNp3VYagYuYWcItn0nx8=
X-Forwarded-Encrypted: i=1; AL+hErEDbWVHdq2822bGaCntV2G35QUlpE1EUpEiKbLaPzi9DVJxMxgg4GdCaYTEWKy1ijmZfkVD24IiLYW9Ddc=@vger.kernel.org
X-Received: by 2002:a05:622a:90c:b0:55c:ec48:199d with SMTP id d75a77b69052e-55d76a904a4mr364421971cf.48.1795703398934;
        Thu, 26 Nov 2026 06:29:58 -0800 (PST)
X-Received: by 2002:a05:622a:90c:b0:55c:ec48:199d with SMTP id d75a77b69052e-55d76a904a4mr364421641cf.48.1795703398410;
        Thu, 26 Nov 2026 06:29:58 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788506b0sm181098511cf.17.2026.11.26.06.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:29:58 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	michael.reeves077@gmail.com,
	marcan@marcan.st,
	j@jannau.net,
	asahi@lists.linux.dev,
	sebastian.reichel@collabora.com
Subject: Re: [PATCH v2 5/5] wifi: brcmfmac: pcie: support inband device wake and deep sleep
Date: Thu, 26 Nov 2026 15:29:42 +0100
Message-ID: <20261126142942.881504-5-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111120748.23795-6-dev@deq.rocks>
References: <20261111120748.23795-6-dev@deq.rocks>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Wed, 11 Nov 2026 13:07:48 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> The BCM4364 and BCM4377 firmware report inband deep sleep in the PCIe
> shared flags. The driver only advertises that it has no out-of-band
> device wake, which leaves deep sleep disabled. The firmware then stays
> awake and keeps its latency tolerance short enough to hold the package
> out of PC10.
>
> Advertise inband device wake when the firmware supports it and follow
> the handshake of the firmware. The device asks for deep sleep while
> device wake is deasserted, the host acknowledges it once it has nothing
> to send, asserts device wake before it uses the rings again and waits
> for the exit note, and deasserts device wake after 200 ms without ring
> writes. Hooks around the ring lock cover every host to device ring
> writer. A system suspend asserts device wake before D3_INFORM and
> acknowledges no deep sleep request until the resume.
>
> Tested on a MacBookPro15,1 (BCM4364) and a MacBookAir9,1 (BCM4377). The
> firmware enters and leaves deep sleep about 40 times a minute at idle
> with Wi-Fi associated, traffic and downloads work, and the package
> reaches PC10 without ignoring the latency tolerance of the Wi-Fi port.
>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>

This patch does not apply to wireless-next main: the struct brcmf_pciedev_info hunk
conflicts with the sig_name/fw_size/skip_reset_vector members added by "wifi:
brcmfmac: Load signed PCIe firmware images". Please rebase on wireless-next.

[...]

> ---
>  .../broadcom/brcm80211/brcmfmac/commonring.c  |  14 ++
>  .../broadcom/brcm80211/brcmfmac/commonring.h  |   5 +
>  .../broadcom/brcm80211/brcmfmac/pcie.c        | 233 +++++++++++++++++-
>  3 files changed, 249 insertions(+), 3 deletions(-)

[...]

> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
> @@ -892,17 +918,184 @@ brcmf_pcie_send_mb_data(struct brcmf_pciedev_info *devinfo, u32 htod_mb_data)

[...]

> +static void brcmf_pcie_ds_send(struct brcmf_pciedev_info *devinfo, u32 data)
> +{
> +	mutex_lock(&devinfo->ds_mutex);
> +	WRITE_ONCE(devinfo->ds_sender, current);
> +	brcmf_pcie_send_mb_data(devinfo, data);
> +	WRITE_ONCE(devinfo->ds_sender, NULL);
> +	mutex_unlock(&devinfo->ds_mutex);
> +}
> +

[...]

> +static void brcmf_pcie_ds_wake(struct brcmf_pciedev_info *devinfo)
> +{
> +	bool assert = false, wait;
> +
> +	if (brcmf_pcie_ds_skip(devinfo))
> +		return;
> +
> +	spin_lock(&devinfo->ds_lock);
> +	devinfo->ds_active++;
> +	if (devinfo->ds_state == BRCMF_PCIE_DS_SLEEP) {
> +		devinfo->ds_state = BRCMF_PCIE_DS_EXIT_WAIT;
> +		assert = true;
> +	}
> +	wait = devinfo->ds_state == BRCMF_PCIE_DS_EXIT_WAIT;
> +	spin_unlock(&devinfo->ds_lock);
> +
> +	if (assert) {
> +		brcmf_dbg(PCIE, "deep sleep: assert device wake\n");
> +		brcmf_pcie_ds_send(devinfo, BRCMF_H2D_HOST_DW_ASSERT);
> +	}
> +	if (!wait)
> +		return;
> +
> +	/* The exit note arrives through the interrupt thread itself */
> +	if (devinfo->in_irq) {
> +		usleep_range(1000, 1100);
> +		return;
> +	}
> +	if (wait_event_timeout(devinfo->ds_wait,
> +			       READ_ONCE(devinfo->ds_state) !=
> +			       BRCMF_PCIE_DS_EXIT_WAIT,
> +			       BRCMF_PCIE_DS_EXIT_TIMEOUT))
> +		return;
> +
> +	brcmf_err(dev_get_drvdata(&devinfo->pdev->dev),
> +		  "no deep sleep exit after device wake\n");
> +	spin_lock(&devinfo->ds_lock);
> +	if (devinfo->ds_state == BRCMF_PCIE_DS_EXIT_WAIT)
> +		devinfo->ds_state = BRCMF_PCIE_DS_AWAKE;
> +	spin_unlock(&devinfo->ds_lock);
> +}
> +

devinfo->in_irq is a device wide flag that is true whenever the interrupt thread is
running. Another thread (tx worker, ioctl, flowring worker) that gets here while the
interrupt thread is running takes this branch, sleeps 1 ms and writes the ring while
the device is still waking up. Please check that current is the interrupt thread (for
instance record it like ds_sender) instead of looking at in_irq.

The return value of brcmf_pcie_ds_send() is ignored here and in the ack paths. If the
write fails, every ring lock waits the full 500 ms for the exit note, or the state
says sleep while the device is awake. Please handle the failure.

[...]

> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
> @@ -1821,6 +2021,10 @@ brcmf_pcie_init_share_ram_info(struct brcmf_pciedev_info *devinfo,
>  		if (shared->flags & BRCMF_PCIE_SHARED_DAR)
>  			host_cap |= BRCMF_HOSTCAP_H2D_DAR;
>  		host_cap |= BRCMF_HOSTCAP_DS_NO_OOB_DW;
> +		if (shared->flags & BRCMF_PCIE_SHARED_INBAND_DS) {
> +			host_cap |= BRCMF_HOSTCAP_DS_INBAND_DW;
> +			devinfo->ds_state = BRCMF_PCIE_DS_ALLOWED;
> +		}
>
>  		brcmf_pcie_write_tcm32(devinfo, sharedram_addr +
>  				       BRCMF_SHARED_HOST_CAP_OFFSET,

The cover letter says this relies on the mailbox over the control ring, but nothing
checks mb_via_ctl here. With the shared memory mailbox the wake and ack messages go
through a different path and I doubt the handshake holds. Please require mb_via_ctl.
Does the firmware want DS_NO_OOB_DW and DS_INBAND_DW both set? This also enables the
feature for every other firmware that sets the flag (BCM4378/4387/4388, CYW), which
were not tested. Please limit it to the tested chips or get it tested on the others.

[...]

> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
> @@ -2757,6 +2966,8 @@ brcmf_pcie_remove(struct pci_dev *pdev)
>  		return;
>
>  	devinfo = bus->bus_priv.pcie->devinfo;
> +	WRITE_ONCE(devinfo->ds_state, BRCMF_PCIE_DS_NONE);
> +	cancel_delayed_work_sync(&devinfo->ds_deassert_work);
>  	brcmf_pcie_bus_console_read(devinfo, false);
>  	brcmf_pcie_fwcon_timer(devinfo, false);
>

This makes all hooks a no-op but does not wake the device first. At idle the device
sleeps most of the time, so the ioctls and flowring deletes that brcmf_detach() sends
after this go to a sleeping device and time out. Also, ds_state is not changed under
ds_lock, so a thread that passed ds_skip() just before can still call
mod_delayed_work() after cancel_delayed_work_sync() (tx worker unlock path or the
interrupt thread exit note), and the work then runs after devinfo is freed. Please
wake the device before disabling, set NONE under ds_lock, check for it under the lock
before queueing the work, and cancel the work after the tx worker and interrupt
handling are stopped.

The series "wifi: brcmfmac: pcie: recover from fatal PCIe errors"
(https://patchwork.kernel.org/series/1203582/) re-probes the device after a fatal
PCIe error with device_reprobe(), so brcmf_pcie_remove() then runs on a device that
just had its link reset and does not answer. Waking the device first would stall
there, and the ring lock hooks would wait on it while devinfo->state is already
DOWN. Please make the wake in remove and the ring lock hooks give up when the
device is not up. Whichever series is applied second will need a rebase.

[...]

> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
> @@ -2811,6 +3022,15 @@ static int brcmf_pcie_pm_enter_D3(struct device *dev)
>  	brcmf_pcie_fwcon_timer(devinfo, false);
>  	brcmf_bus_change_state(bus, BRCMF_BUS_DOWN);
>
> +	if (devinfo->ds_state != BRCMF_PCIE_DS_NONE) {
> +		spin_lock(&devinfo->ds_lock);
> +		devinfo->ds_suspend = true;
> +		spin_unlock(&devinfo->ds_lock);
> +		cancel_delayed_work_sync(&devinfo->ds_deassert_work);
> +		brcmf_pcie_ds_wake(devinfo);
> +		brcmf_pcie_ds_idle(devinfo);
> +	}
> +
>  	devinfo->mbdata_completed = false;
>  	brcmf_pcie_send_mb_data(devinfo, BRCMF_H2D_HOST_D3_INFORM);
>

ds_suspend is not cleared when brcmf_pcie_pm_enter_D3() fails further down (the
WoWL D3 timeout returns -EIO). The PM core does not resume this device then, so no
deep sleep request is acked anymore and the deassert work never runs again. Please
clear it on that error path.

Regards,
Arend
