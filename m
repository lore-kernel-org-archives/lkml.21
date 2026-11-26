Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795725223;
	b=LaCtinZDoJQSqOFpaQhsk4FX05UBWnKmSfgA02i3IZ2Gd/+RUkzebRKrVcL8x39gUeqQ
	 scvpsmzQZAq6ZOW8dTGlDzOshU7wuEHAUwwRI+lxgdOmBSRevi7kssz5IZJv+zdKuCmRf
	 NeQ+cVgrzInXFFBosHGxcVWqhrmTkLQ66QiiJoUUD3t0RXXa65tR0KpeDzBQqHm7sqaoM
	 l2HZhjqu9/EBWNH/TpYaZyTowufVEq/a9umZQBqlgQzVvnpkKaGb5VyUAv5VU0jCAU4Lz
	 FIMKZa1qaTwM9sQxzN5EBgq4iZ8lsxmohTu0lJYLBL3IDSdl4CxuCK1YOVtW2F2b9fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795725223;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=6+IvshoIOnpz5rdUCHpe36q5hslcK32E1hpH+6SscWk=;
	b=jZ08sxaf4AL5KDnlGM663Y+BwJ7GkKORuUSvs+9Lxr8dyHTdytH4kB4FYZCe03mc7/NB
	 7ASI+tLzLFpMWXl0nEVD/ZRkHN9o6k5GuVIwenZcZfRWlrbX6n+8S4jdNkbxZyzltHlV0
	 6vL3QPI/oxh11ciX6tdbaN70FhO+TsffDUaqUhva4cGO2h/yvDKlXbmXaO3qUOSZGK5W7
	 ovOr2ypPPX2RIdAFznAX3Blr5WtXEcAeEctFLJ+YuaLrnlqo2kFDqGSquYlJVrBqM91K7
	 Wt/+YWxnNh5dpvbqiIByfmWwD32pgz8M78daFP3uipFa8RzlS2TfaQvunrzyNFCu64w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YlW5zaiv;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFF3606A69B
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 20:33:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EFF3606A69B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YlW5zaiv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795725222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6+IvshoIOnpz5rdUCHpe36q5hslcK32E1hpH+6SscWk=;
	b=YlW5zaivzjdC8Bj6Az4106uo3B15fbB6BG2dlIRDtUpkjpLzQTCy3OiYTyC6xTYqE0gW/F
	zqxcRrhtqHhKLn4qS3Q/bU3Fsk+0UtYB/fR1JOjwZICAfV+HK90PUMRiSo2h6qzvDxARSk
	dTOox6yv96+Xggd+jUpVM+F7tkykLI8=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-518-HfJwxuRLNPWteVoBnAXBug-1; Thu,
 26 Nov 2026 20:33:38 +0000
X-MC-Unique: HfJwxuRLNPWteVoBnAXBug-1
X-Mimecast-MFC-AGG-ID: HfJwxuRLNPWteVoBnAXBug_1795725215
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 30D2219541A6;
	Thu, 26 Nov 2026 20:33:35 +0000 (UTC)
Received: from ivecera-thinkpadp16vgen1.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0195D1801977;
	Thu, 26 Nov 2026 20:33:28 +0000 (UTC)
From: Ivan Vecera <ivecera@redhat.com>
To: netdev@vger.kernel.org
Cc: Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	Min Li <min.li@microchip.com>,
	Grzegorz Nitka <grzegorz.nitka@intel.com>,
	Karol Kolacinski <karol.kolacinski@intel.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Petr Oros <poros@redhat.com>
Subject: [PATCH RFC net-next 08/19] dpll: drop the state change exception for pins with a firmware node
Date: Thu, 26 Nov 2026 21:32:20 +0100
Message-ID: <20261126203231.934632-9-ivecera@redhat.com>
In-Reply-To: <20261126203231.934632-1-ivecera@redhat.com>
References: <20261126203231.934632-1-ivecera@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Commit 521b6d5de08d ("dpll: allow fwnode pins to attempt state change
without capability bit") let user space try to set the state of a pin
with a firmware node also without DPLL_PIN_CAPABILITIES_STATE_CAN_CHANGE.
It was needed for the zl3073x output pins that ice registered with its
TXC and TSPLL DPLLs. ice now uses its own pins, which have the
capability, and zl3073x, the only driver that sets a firmware node, gives
it to every pin whose state can be set.

Check the capability for all pins again.

Signed-off-by: Ivan Vecera <ivecera@redhat.com>
---
 drivers/dpll/dpll_netlink.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/dpll/dpll_netlink.c b/drivers/dpll/dpll_netlink.c
index 931ea2027cf68f..fab234553b422a 100644
--- a/drivers/dpll/dpll_netlink.c
+++ b/drivers/dpll/dpll_netlink.c
@@ -1328,11 +1328,8 @@ dpll_pin_on_pin_state_set(struct dpll_pin *pin, u32 parent_idx,
 	unsigned long i;
 	int ret;
 
-	/* fwnode pins may not set the capability bit upfront; let the ops
-	 * layer return -EOPNOTSUPP if the operation is unsupported.
-	 */
 	if (!(DPLL_PIN_CAPABILITIES_STATE_CAN_CHANGE &
-	      pin->prop.capabilities) && !pin->fwnode) {
+	      pin->prop.capabilities)) {
 		NL_SET_ERR_MSG(extack, "state changing is not allowed");
 		return -EOPNOTSUPP;
 	}
@@ -1367,11 +1364,8 @@ dpll_pin_state_set(struct dpll_device *dpll, struct dpll_pin *pin,
 	struct dpll_pin_ref *ref;
 	int ret;
 
-	/* fwnode pins may not set the capability bit upfront; let the ops
-	 * layer return -EOPNOTSUPP if the operation is unsupported.
-	 */
 	if (!(DPLL_PIN_CAPABILITIES_STATE_CAN_CHANGE &
-	      pin->prop.capabilities) && !pin->fwnode) {
+	      pin->prop.capabilities)) {
 		NL_SET_ERR_MSG(extack, "state changing is not allowed");
 		return -EOPNOTSUPP;
 	}
-- 
2.56.1

