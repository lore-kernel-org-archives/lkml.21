Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769869;
	b=kD2q9ZxaSR6dBVHFDfCW5DhgDMVEtte5FSl0MTqWWBB+Jvotu9nR0FnJ+AyNpB3cGA1H
	 ++Fyi/ATaZVDyGt+ZnlCeiFkFXLJCF5/9VTdYR/nCZMoPVISkGKati99I80XKQT3H1gYr
	 9u5+Sj6slf468+bDUbRALJHkEiwZpMBzlMynXsol0vURtHiYKzL8rmx8pXB7n6k7yDAE8
	 fInNUWtu+ibLJ+baZ02b+X+iXB9voirf1eZVeGtXHTJB9ygKBzbysrioBPFplHNJ4UfTv
	 KZ8qBMrGiywX8RNqsuL/UGaGsTJmIQ5o9yCwdoF2yt1Dkmacy3CujsP51A19TOQJGgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769869;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=8v8Ip+plxXN89vEKmV5QJRl4QCWxKVrwNkDboP/e/Tk=;
	b=O8ATJB7Ke4gDDvUATAZzwCrhHAI0NF3cMktY41wG2w5GWCAtZNT6gAaYUscfnL+KhcLS
	 7evjvf6URclk1LMncnSh4stgUFCTdCrHQHHWqEFFKdMIobrHoVcBzM3DJ6cFH7YT1DUdR
	 w5NoNlhTl629RGI1pcSdQD7wdthSh8vY/+L3UpY+r3QHNzkp9Flb5E5prW/Olh0pbNIve
	 9Mv8STir94GlPgEkluCNr7MVazWnfYpTccAHZRRWQshZ97hplQ8BwLiobdGt5aHnr5RM0
	 3td4psKmk4bKYg0vb5n2fU5Jn/8rIT2D9O7MTyMODoNJ5KznpbLjq/HVB5UBk9Ys5AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QvolNq4v;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DC3606A33A
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70DC3606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QvolNq4v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795769867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8v8Ip+plxXN89vEKmV5QJRl4QCWxKVrwNkDboP/e/Tk=;
	b=QvolNq4v63Bo5RGFpq39bxePzS2rOg7QuGZTGheiC451AbuS/w5AZMDTk6vJWIQQ75cjem
	o3Mih3mbEh2yalHN3SVANYq0lVleLpX6p4MnbKynXRwdcGDeFw73+8BphtEdY3DjdjiFTG
	apZiaZvhJt+qMrH79yRuzHl6VqJlEMs=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-504-rGpobC8YPeCwkelkffy9sQ-1; Fri,
 27 Nov 2026 08:57:42 +0000
X-MC-Unique: rGpobC8YPeCwkelkffy9sQ-1
X-Mimecast-MFC-AGG-ID: rGpobC8YPeCwkelkffy9sQ_1795769859
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CC57F1955D8B;
	Fri, 27 Nov 2026 08:57:38 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.tpbc.com (unknown [10.44.48.12])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BB1B644B;
	Fri, 27 Nov 2026 08:57:32 +0000 (UTC)
From: Petr Oros <poros@redhat.com>
To: netdev@vger.kernel.org
Cc: Petr Oros <poros@redhat.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Simon Horman <horms@kernel.org>,
	Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
	Grzegorz Nitka <grzegorz.nitka@intel.com>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Wojciech Drewek <wojciech.drewek@intel.com>,
	Marcin Szycik <marcin.szycik@linux.intel.com>,
	Martyna Szapar-Mudlaw <martyna.szapar-mudlaw@linux.intel.com>,
	Ivan Vecera <ivecera@redhat.com>,
	Alice Michael <alice.michael@intel.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jesse Brandeburg <jbrandeb@kernel.org>,
	Patryk Holda <patryk.holda@intel.com>,
	Rinitha S <sx.rinitha@intel.com>,
	Aaron Ma <aaron.ma@canonical.com>,
	intel-wired-lan@lists.osuosl.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v5 2/4] ice: do not leave switchdev mode while representors exist
Date: Fri, 27 Nov 2026 09:57:07 +0100
Message-ID: <20261127085714.1207361-3-poros@redhat.com>
In-Reply-To: <20261127085714.1207361-1-poros@redhat.com>
References: <20261127085714.1207361-1-poros@redhat.com>
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
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

ice_eswitch_mode_set() refuses a mode change only while VFs exist, but a
subfunction port has a representor and a switchdev session too. devlink
core usually refuses the change first, because of the devlink rate nodes
the representors export, but ice exports none while DCB is active. A
switch to legacy then destroys the representor xarray under the running
session, the representors leak, and the uplink stays in its switchdev
configuration.

Refuse the mode change while the representor xarray is not empty.

Found by AI code review. Reproduced on an E810-C (FW 8.1.1, ICE COMMS
package 1.3.55.0) with the firmware LLDP agent off, without kernel
changes:

  dcb ets set dev $PF tc-tsa all:ets tc-bw 0:50 1:50 prio-tc 1:1
  devlink dev eswitch set pci/$BDF mode switchdev
  devlink port add pci/$BDF flavour pcisf pfnum 0 sfnum 88
  devlink dev eswitch set pci/$BDF mode legacy

The last command succeeded, the representor netdev stayed registered
and promisc off no longer took effect on the PF. With this patch the
command fails with "Remove all subfunction ports before changing
eswitch mode". No kernel selftests cover this.

Fixes: 977514fb0fa8 ("ice: create port representor for SF")
Signed-off-by: Petr Oros <poros@redhat.com>
---
v5:
- New patch. Without it a switch to legacy can orphan a switchdev
  session, and patch 3 resyncs the uplink only when a session ends.
---
 drivers/net/ethernet/intel/ice/ice_eswitch.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/ethernet/intel/ice/ice_eswitch.c b/drivers/net/ethernet/intel/ice/ice_eswitch.c
index 6e7bba4738989b..c96b201901f48c 100644
--- a/drivers/net/ethernet/intel/ice/ice_eswitch.c
+++ b/drivers/net/ethernet/intel/ice/ice_eswitch.c
@@ -354,6 +354,13 @@ ice_eswitch_mode_set(struct devlink *devlink, u16 mode,
 		return -EOPNOTSUPP;
 	}
 
+	/* subfunction ports have representors too */
+	if (!xa_empty(&pf->eswitch.reprs)) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "Remove all subfunction ports before changing eswitch mode");
+		return -EOPNOTSUPP;
+	}
+
 	switch (mode) {
 	case DEVLINK_ESWITCH_MODE_LEGACY:
 		dev_info(ice_pf_to_dev(pf), "PF %d changed eswitch mode to legacy",
-- 
2.56.1

