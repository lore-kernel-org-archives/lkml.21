Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795725219;
	b=LFMeIZuSeTCS25jnv8sWnbsM95LxqOXroOh3wA94jjQZxg6exZRQo/2rG8u/UcYJgrGC
	 ODzCV/gkHlvprzDj0gnLzhyIO6kG8V9bLba5CSENamVcBNoSvPsoksQ56xfYl4weEEW0u
	 Py2HgIOj9stnlZXs075x080BBTMTMD5GaOYqB3OIzMBOgC4eaZELTayzQ79Pr2daq1c+W
	 jOW2iAZ2FBZu2reXuVlg5DmaY82nnYII3AkFlCBT6io87lOb2P9yKjuoVwLrY3S4qHaLB
	 pWXHP9ZJiISwyhiDxzQ5zUwrR1xSqvhwJV5DF5YFXdJ5elsp/6DQqpFQ8nNW2hAGm6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795725219;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=YNczEMn85iEzJ9tHP2sIt8DhX+H62qmfbpLilMNh1DQ=;
	b=rUMg/kCzrjcDKHUtqjdcOZrAqjp68HbHxsMEanvkvdXFHWB8hxnNMoECHB/KIi2MaqDT
	 hOQGF/5B0o1y4LmYvGSDjY8KoOB3KnVCnwBMaZkRDq95rY60ZkwVschyxfx2CKXse3OGx
	 fKdVjGp8T3aEZAWCaed4WamoJN2EAHc8ZLZfdkAMz0E23GzjVYTySpHVuj/Y82B4hfZOt
	 X8C84N0hA8y4eTN1o4r4riLl02Tk2jIVE9d9YWWA1k5T/AMzMeSNumx8VulkZOi84yl6O
	 Ui8F9e9T7OVwRBNnYnzPpic76mHJbkMVwvrCDI2UP5M95dND/jYnAY2jz5/ynrhIgiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CxgiP3HY;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB39606A327
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 20:33:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AB39606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CxgiP3HY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795725217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YNczEMn85iEzJ9tHP2sIt8DhX+H62qmfbpLilMNh1DQ=;
	b=CxgiP3HY6j2yoPj1yicLBx07pKbg0llIQfM4MY23x6UFF5RBHoupyYUaLQFAbF6jvFGEAC
	pfok8V4x80lpFqo2dRFX+1P/DajW/f53at9QJisJH8Q8JwMzEHTeGMIxL4+uNh4g8VBc1u
	bDmHYiY7xxRkruaaH7/j2db8htHxb7s=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-641-C6c1jGXPN4mtFHbqkoWlpQ-1; Thu,
 26 Nov 2026 20:33:31 +0000
X-MC-Unique: C6c1jGXPN4mtFHbqkoWlpQ-1
X-Mimecast-MFC-AGG-ID: C6c1jGXPN4mtFHbqkoWlpQ_1795725208
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 93432195605F;
	Thu, 26 Nov 2026 20:33:28 +0000 (UTC)
Received: from ivecera-thinkpadp16vgen1.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 037F51801A6D;
	Thu, 26 Nov 2026 20:33:21 +0000 (UTC)
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
Subject: [PATCH RFC net-next 07/19] dpll: register pins only with a DPLL of their owner
Date: Thu, 26 Nov 2026 21:32:19 +0100
Message-ID: <20261126203231.934632-8-ivecera@redhat.com>
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

Commit c191b319f208 ("dpll: allow registering FW-identified pin with a
different DPLL") allowed a pin with a firmware node to be registered
with a DPLL of another owner. Its only user was ice on E825, which now
links its own pins with the zl3073x pins instead.

Require the same owner for every pin again and document the rule.

Signed-off-by: Ivan Vecera <ivecera@redhat.com>
---
 Documentation/driver-api/dpll.rst |  8 ++++++--
 drivers/dpll/dpll_core.c          | 12 ++++++------
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/Documentation/driver-api/dpll.rst b/Documentation/driver-api/dpll.rst
index 7b083a59f0122d..90c88fcf21b385 100644
--- a/Documentation/driver-api/dpll.rst
+++ b/Documentation/driver-api/dpll.rst
@@ -350,8 +350,12 @@ bound to only one other pin at any given time.
     ``DPLL_A_PIN_STATE``         state of Reference SYNC connection
   ============================== ==========================================
 
-Pin links
-=========
+Pin ownership and links
+=======================
+
+The owner of a dpll device or a pin is identified by the module and the
+clock_id passed to dpll_device_get() or dpll_pin_get(). dpll_pin_register()
+accepts only a dpll device of the same owner as the pin.
 
 A pin represents a pad of the device whose driver registers it. When the
 board connects a pad of one device to a pad of another one, for example an
diff --git a/drivers/dpll/dpll_core.c b/drivers/dpll/dpll_core.c
index 7fd84b0e90e993..57eb4ff2c320e5 100644
--- a/drivers/dpll/dpll_core.c
+++ b/drivers/dpll/dpll_core.c
@@ -983,6 +983,9 @@ __dpll_pin_register(struct dpll_device *dpll, struct dpll_pin *pin,
  * @ops: ops for a dpll pin ops
  * @priv: pointer to private information of owner
  *
+ * The @dpll and the @pin must have the same owner, they must be created with
+ * the same module and clock_id.
+ *
  * Context: Acquires a lock (dpll_lock)
  * Return:
  * * 0 on success
@@ -1015,13 +1018,10 @@ dpll_pin_register(struct dpll_device *dpll, struct dpll_pin *pin,
 		goto out_unlock;
 	}
 
-	/*
-	 * For pins identified via firmware (pin->fwnode), allow registration
-	 * even if the pin's (module, clock_id) differs from the target DPLL.
-	 * For non-fwnode pins, require a strict (module, clock_id) match.
+	/* A pin of another owner is connected by a link, see
+	 * dpll_pin_link_add().
 	 */
-	if (!pin->fwnode &&
-	    WARN_ON_ONCE(dpll->module != pin->module ||
+	if (WARN_ON_ONCE(dpll->module != pin->module ||
 			 dpll->clock_id != pin->clock_id)) {
 		ret = -EINVAL;
 		goto out_unlock;
-- 
2.56.1

