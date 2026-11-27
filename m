Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795786500;
	b=a3sn8ra0VqFyChlpZKqMJqzEj4HYiFvGwvQK8a31/H22UHyRkOpRG+FbVBt6IehszYcg
	 T9HFyeQKMEq85PyXbt1PkbRKbs1adeUz4FIfv/bzbmztzWN/Nfj/fGsTu/yjgrkGBipJL
	 +3Q1/1JS9WLFHpvaUpt/6cJ9JJp6Ni549htAQIqe+LCmL1lRmT7UNzMpdXQcI+Ol173iE
	 oJzSmEASF4h3peP2dlUYu6Br0WMQlMdjdz49OkHdf05JB4/s5wdJUHtSWElSxdwqstsoE
	 qnYcBH+otbEd5K/A3+4MB2A5qBmbhSjYfbP3fncpDHfsLzCPYBmFdbRGccj2luPsNig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786500;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=aiz7OskXSIxLqPwAnUazU/gTX3xJwNj2Edl+jQMGQGo=;
	b=hCGuhaO7u4CS8LXk+WI8zKaQJvQmCkAwyCh6mJ3Fj7uI2aTjzIiGn19iBGR935zyxSpl
	 YGTffOK4ndo7bwyJ28NLUBKJX6aIWuUjWQSjnaVkbhrAZVIDCmaU51y17vrz0LlnduzTt
	 8FJkG0+hig59+XgKuN9pVOGKZ9ceMXIHx9VDtfOxjD+kwzYEPIni3KPT4WCmdiB4M6Hq3
	 QOLTXxeed0B1Qsmjb3lnXaBtRcAKdioNPklvPlFI4dgkztAW+wprnB5TYaU7xCXRQalYK
	 4Ym0gJVm/xCEAi15weNl78qkrD+GO2BUJj583Acu9BmakTiIBDtIso3CUHc5Mmh7e5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WOV7E5nZ;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059A2606A324
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:34:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 059A2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WOV7E5nZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795786498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aiz7OskXSIxLqPwAnUazU/gTX3xJwNj2Edl+jQMGQGo=;
	b=WOV7E5nZInwBVGGexjZxWclH7OmuxGD339enNb/KDfIogO/vYevS2Rhg91ZfmYFYuoSD3a
	Go3EG6Xk/PbehqvSgOX7U8Zns2nIXHRutFxXw34+kEqr5+hs4XvwFf/l2tB8HfAL8FfyBk
	VZGPpaLx4LSK8x2jgTOkt+111ofWfw8=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-22-EzbpiHW1PBGbmjnfkGDfTA-1; Fri,
 27 Nov 2026 13:34:53 +0000
X-MC-Unique: EzbpiHW1PBGbmjnfkGDfTA-1
X-Mimecast-MFC-AGG-ID: EzbpiHW1PBGbmjnfkGDfTA_1795786491
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 75C4F1954223;
	Fri, 27 Nov 2026 13:34:50 +0000 (UTC)
Received: from [100.91.101.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0461F18011D4;
	Fri, 27 Nov 2026 13:34:44 +0000 (UTC)
Message-ID: <768596a5-b2d6-4778-bb24-2b26244fc5e9@redhat.com>
Date: Fri, 27 Nov 2026 14:34:43 +0100
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
Subject: Re: [PATCH net v5 2/4] ice: do not leave switchdev mode while
 representors exist
To: Petr Oros <poros@redhat.com>, netdev@vger.kernel.org
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
 Simon Horman <horms@kernel.org>,
 Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
 Grzegorz Nitka <grzegorz.nitka@intel.com>,
 Paul Menzel <pmenzel@molgen.mpg.de>,
 Wojciech Drewek <wojciech.drewek@intel.com>,
 Marcin Szycik <marcin.szycik@linux.intel.com>,
 Martyna Szapar-Mudlaw <martyna.szapar-mudlaw@linux.intel.com>,
 Alice Michael <alice.michael@intel.com>,
 Jacob Keller <jacob.e.keller@intel.com>,
 Jesse Brandeburg <jbrandeb@kernel.org>, Patryk Holda
 <patryk.holda@intel.com>, Rinitha S <sx.rinitha@intel.com>,
 Aaron Ma <aaron.ma@canonical.com>, intel-wired-lan@lists.osuosl.org,
 linux-kernel@vger.kernel.org
References: <20261127085714.1207361-1-poros@redhat.com>
 <20261127085714.1207361-3-poros@redhat.com>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <20261127085714.1207361-3-poros@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On 11/27/26 09:57, Petr Oros wrote:
> ice_eswitch_mode_set() refuses a mode change only while VFs exist, but a
> subfunction port has a representor and a switchdev session too. devlink
> core usually refuses the change first, because of the devlink rate nodes
> the representors export, but ice exports none while DCB is active. A
> switch to legacy then destroys the representor xarray under the running
> session, the representors leak, and the uplink stays in its switchdev
> configuration.
> 
> Refuse the mode change while the representor xarray is not empty.
> 
> Found by AI code review. Reproduced on an E810-C (FW 8.1.1, ICE COMMS
> package 1.3.55.0) with the firmware LLDP agent off, without kernel
> changes:
> 
>    dcb ets set dev $PF tc-tsa all:ets tc-bw 0:50 1:50 prio-tc 1:1
>    devlink dev eswitch set pci/$BDF mode switchdev
>    devlink port add pci/$BDF flavour pcisf pfnum 0 sfnum 88
>    devlink dev eswitch set pci/$BDF mode legacy
> 
> The last command succeeded, the representor netdev stayed registered
> and promisc off no longer took effect on the PF. With this patch the
> command fails with "Remove all subfunction ports before changing
> eswitch mode". No kernel selftests cover this.
> 
> Fixes: 977514fb0fa8 ("ice: create port representor for SF")
> Signed-off-by: Petr Oros <poros@redhat.com>
> ---
> v5:
> - New patch. Without it a switch to legacy can orphan a switchdev
>    session, and patch 3 resyncs the uplink only when a session ends.
> ---
>   drivers/net/ethernet/intel/ice/ice_eswitch.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/net/ethernet/intel/ice/ice_eswitch.c b/drivers/net/ethernet/intel/ice/ice_eswitch.c
> index 6e7bba4738989b..c96b201901f48c 100644
> --- a/drivers/net/ethernet/intel/ice/ice_eswitch.c
> +++ b/drivers/net/ethernet/intel/ice/ice_eswitch.c
> @@ -354,6 +354,13 @@ ice_eswitch_mode_set(struct devlink *devlink, u16 mode,
>   		return -EOPNOTSUPP;
>   	}
>   
> +	/* subfunction ports have representors too */
> +	if (!xa_empty(&pf->eswitch.reprs)) {
> +		NL_SET_ERR_MSG_MOD(extack,
> +				   "Remove all subfunction ports before changing eswitch mode");
> +		return -EOPNOTSUPP;
> +	}
> +
>   	switch (mode) {
>   	case DEVLINK_ESWITCH_MODE_LEGACY:
>   		dev_info(ice_pf_to_dev(pf), "PF %d changed eswitch mode to legacy",

Reviewed-by: Ivan Vecera <ivecera@redhat.com>

