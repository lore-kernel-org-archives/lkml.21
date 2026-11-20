Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795207509;
	b=4QLYCqwCz3BabP+JjrYHs84dQMrJkUVi/sTkp8hEASTsB352Ue31ZLxKOzSIf9XlmfTu
	 hUy05pw7JaOga4K5ZabmvoSbOjTj8VlTSv4ph/bwTHMOQJ2sAcxMkYRnpj+SM3/dG0QDZ
	 9bNwayUMHbPRuYyJKEid0TW9SDS8E1Isv74MmC3JUgXSgmn8DUcAMfQw135O2uC0WXmoP
	 gsbldUoY0eaVnJHf0l0DpLosxs2yLKOD2XdRYvKliLIywK7bv3CkehK9V3EV42BrsEc7n
	 Y/0E7HWxTyfAcudfXPPlKbyJCuDG9sG67yRaDgZDemLc3TzPHKZ5jOgvkYF9M1MHZcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795207509;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Qlhr0caDgQMPp5g7aUUklMP8JG4C6c1PLT64HAG56ZQ=;
	b=ej2feJqMZBMZGU6ORABvR/GixAQKFEV7CDD2fOFKLza065QbmQN4lPNhy0C58PkfLEqx
	 H5uEOHaXi8XFyY5EJVUmtc89mN2459JYFXMYGZ2JEHbHqmFzxu0eH9ItQ9c2rQ9wt5y1I
	 zA0D8r71vBaI2p9B4dldjRctDlTp5ChP074T1QUGpwJTgjvuyo/rHwuSIKAcvnAVoWNNv
	 ZIdgidcRyBdkqfUtHatUZ60Kwf9FDXpXxeEQ0Aul3QpxqIPE1NlT2GXK/syMSyVUBR5mV
	 r7ZCra2032joWCIDakKTXJ9OIjIXqFlt9JtwHmRh7xyBr8dRW2PiD7SHHTdxiSsq+XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0LHhLZ8N;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E75E606C0C0
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:45:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E75E606C0C0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0LHhLZ8N
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-38431138772so1693006eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795207500; x=1795812300; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qlhr0caDgQMPp5g7aUUklMP8JG4C6c1PLT64HAG56ZQ=;
        b=0LHhLZ8NjQrW/n/rrPZ4SmfWECVhzulNWjHiK5bu0SK4MkvO1LeeeC+/OZyjlnKKjb
         YPoWbCByh1HIep5lMZY9iGejj4oSaDyolKdzzM3KneTBfMFrDMYhQ2DoW/PqZIWyyOr9
         Im+xcxprklKMHEluxzzKKHHkfR0zLVN98N7LWEJFxy+xcWtqYSK6nmhzMw0jXI2jyTk7
         RgnP3lYqD0Cj0l96Ugwv/jat0DrMEO2sqfydaZtjMaSM+PJ4HVdG/fTc5f+iY6UWtQ1E
         3xaXEPFWYuf/91eLwd7O+gLA/lr5ksI/qThj6w9WQvK2H4OD3Il9z38TqiE1mrLXMl2s
         UbMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795207500; x=1795812300;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qlhr0caDgQMPp5g7aUUklMP8JG4C6c1PLT64HAG56ZQ=;
        b=Y2teipMmHFRRip49MoU2XZyHCisAi2+MYpPs6MBAmtHCDwvHwM1M9j235+oXWuXtKU
         9m67FIgeTzap8LM0ARAzX0uutDyZTU6tZYJNLvdKq5OmR2QeDayTyBZx78PbF6+eIx8d
         DhMkBnoS2R7G0qPI9sxZK9rS/zZxkdVZH0lC5FVtxDt34d0LIvpPM+bgjDA2jtj6LnEB
         jWZZfvOjQudqdCITPL7NMZ+uHKkMzCYtUxOC9yWGAQNkI/HIPyWRxiUjJz/sATq6JtPx
         wKbboS7sDzZbIq4KMceWXOoDqGJDXFTKijPkLtGOwoeJQgQeIZJDVic5R+yW1JFeuH/B
         2GtQ==
X-Forwarded-Encrypted: i=1; AL+hErFjgptF10AKqnq5fWDffyHktVoNz3vQP3zcMzR0FRDQm0PKnX8/6dXrtc0IREZK5uAG6WdvwOzVkfWjaXs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8+gHMxxjT8Q15K354uX7Fq8dguxD8wH9fZ5lPFiBuq1TA1Toz
	Y1L/mu1QnbRiUS6CkMbz1URG4g7oEEnkEIlkXiUHiZAry9/U2hOvQMQU
X-Gm-Gg: AZFdTZejoEAklbkE1sv0lkYvwcwIpeqKmfvhNsXGOVBknVxeAkzxWnahX+tPBvzGGl6
	oWHqZ5GSLgDyvwGxG91y5bPsGUqeYX+KhEuK4dtoERf6GwyIL79gLsFg/IxNWbcgd1mCYN2fK78
	HlKhzYwzxB6M0N/29gumC05wUSZN+86scgE5miZen/7ALipxGEkMAIsTuHJhbvDJheq724oP9xA
	qg7eXEQsDE9VDOcUuo1dBVlZfuPJK6KCy0KENBF4VGt2N7cAG3bhqrqImn/n+kOSCIalcGNR+Ef
	/I9LcQ3Omn3IUwF+2DWkMWjHS5gPfHPNt0gXJTKo1TgOycnE/J1GK8zcODj0cM88DmlTl+3H0OG
	nL8sxwiZzPIbXSH9G6RXF0Z6/CxHWtq5rLsCQF8+Ur5MKp09E0MjSUQf9bZp+ondSnND4MMWgxm
	ayGI5a+pMZTUWTqZpgCDIrJoXnCazQTOg6hFHCIgkCLNtSImsSLFOSd+u/O0Fw+OkgH6b3L/PvT
	G7G/o2eXUcQIg8dE/nwYheeGHY12wuAszQ3s2iAJIp0YhNm1maQFLKESBDNdXG4uCMvR+Iyx1EA
	OE0PAIVLz3vMILwEemDi2tI8i8Q=
X-Received: by 2002:a05:693c:62d2:b0:384:7b5b:e1d4 with SMTP id 5a478bee46e88-3869a9b266fmr214986eec.17.1795207499992;
        Fri, 20 Nov 2026 12:44:59 -0800 (PST)
Received: from cxlqual ([220.120.90.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385665f21aesm13694113eec.4.2026.11.20.12.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:44:59 -0800 (PST)
From: Anisa Su <anisa.su887@gmail.com>
X-Google-Original-From: Anisa Su <anisa.su@samsung.com>
Date: Sat, 21 Nov 2026 05:47:11 +0900
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: Anisa Su <anisa.su887@gmail.com>, linux-cxl@vger.kernel.org,
	nvdimm@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Davidlohr Bueso <dave@stgolabs.net>, Ira Weiny <iweiny@kernel.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Fan Ni <nifan.cxl@gmail.com>, Li Ming <ming.li@zohomail.com>,
	Benjamin Cheatham <benjamin.cheatham@amd.com>,
	Gregory Price <gourry@gourry.net>,
	Richard Cheng <icheng@nvidia.com>
Subject: Re: [PATCH v1 05/14] cxl/mem: Add 20 second timeout for stalled DC
 event chains
Message-ID: <awCxz_MlCTGYh_lE@cxlqual>
References: <20261104230445.66625-1-anisa.su@samsung.com>
 <20261104230445.66625-6-anisa.su@samsung.com>
 <20261117030014.6676dd47@jic23-hlaptop>
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
In-Reply-To: <20261117030014.6676dd47@jic23-hlaptop>

On Tue, Nov 17, 2026 at 03:00:14AM +0000, Jonathan Cameron wrote:
> On Thu,  5 Nov 2026 08:02:29 +0900
> Anisa Su <anisa.su887@gmail.com> wrote:
> 
> > A Dynamic Capacity event can span multiple event records grouped
> > together by the CXL_DCD_EVENT_MORE flag. Extents are staged in the
> > pending list until the last event record ('More'=0) is received, at
> > which point the chain is processed. If the device opens such a chain
> > (More=1) but never sends the closing record, the staged list sits
> > indefinitely.
> > 
> > Add a delayed-work watchdog that drops the chain on timeout: an add
> > chain is refused with an empty Add Dynamic Capacity Response (4802h),
> > a release chain is left for the device to retry.
> > 
> > The spec sets no limit; 20s is a generous upper bound that may be
> > tightened later, and guards against a lost mailbox response or a
> > crashed fabric manager.
> 
> My gut feeling on this is don't paper over it. 
> I think there should be a standard recovery flow from crashed fabric
> manager and today we may have a hole here that needs closing. That
> might be as simple as a zero length dcd extent sent with the more
> flag not set to terminate any sequences in flight.
> 
> Lost mailbox responses should only happen if something worse
> went on so I'd expect some other ras indication.
> 
> Anyhow, I'd suggest asking your spec folk to raise this (or poking John
> Groves)..
> 
Thanks for the review Jonathan :)

Sorry I was actually mistaken. I double-checked the spec and
the FMAPI Initiate Add/Release is a single command with all extents included,
not split across multiple payloads, so a crashed FM should not cause issues
on the host side.

And the device only clears records when the host sends the Clear Event
Records command, so records should not be lost. I think this patch cna
be dropped actually.

The only reason afaict the host wouldn't receive a closing record would
be a device bug.

Thanks,
Anisa
> > 
> > The deadline is fixed when the chain opens rather than extended per
> > record, so a device cannot keep a chain alive, and the staged list
> > growing, by streaming More=1 records.
> > 
> > Signed-off-by: Anisa Su <anisa.su@samsung.com>
> > Tested-by: Wonjae Lee <wj28.lee@samsung.com>
> > Tested-by: Junhee Park <jh9934.park@samsung.com>
> > Tested-by: Heesoo Kim <habil.kim@samsung.com>
> > ---
> >  drivers/cxl/core/mbox.c | 84 +++++++++++++++++++++++++++++++++++++++++
> >  drivers/cxl/cxlmem.h    | 15 ++++++++
> >  2 files changed, 99 insertions(+)
> > 
> > diff --git a/drivers/cxl/core/mbox.c b/drivers/cxl/core/mbox.c
> > index 3acf5ace48db..fea910e6c510 100644
> > --- a/drivers/cxl/core/mbox.c
> > +++ b/drivers/cxl/core/mbox.c
> > @@ -873,6 +873,8 @@ static const uuid_t log_uuid[] = {
> >  	[VENDOR_DEBUG_UUID] = DEFINE_CXL_VENDOR_DEBUG_UUID,
> >  };
> >  
> > +static void cxl_cancel_dcd_chain_work(void *_mds);
> > +
> >  /**
> >   * cxl_enumerate_cmds() - Enumerate commands for a device.
> >   * @mds: The driver data for the operation
> > @@ -891,6 +893,16 @@ int cxl_enumerate_cmds(struct cxl_memdev_state *mds)
> >  	struct cxl_mem_command *cmd;
> >  	int i, rc;
> >  
> > +	/*
> > +	 * The DC chain watchdog sends a mailbox command when it fires.  Register
> > +	 * its cancellation here, once the mailbox is usable, so devm runs it
> > +	 * before the mailbox goes away: in cxl_pci the device registers were
> > +	 * mapped before this point and are unmapped after the cancel.
> > +	 */
> > +	rc = devm_add_action_or_reset(dev, cxl_cancel_dcd_chain_work, mds);
> > +	if (rc)
> > +		return rc;
> > +
> >  	gsl = cxl_get_gsl(mds);
> >  	if (IS_ERR(gsl))
> >  		return PTR_ERR(gsl);
> > @@ -1198,6 +1210,14 @@ static void clear_pending_extents(void *_mds)
> >  		delete_extent_node(pos);
> >  }
> >  
> > +/*
> > + * Bound on how long the host will wait for a device to finish a
> > + * multi-record DC event chain (More=1 ... More=0) before refusing the
> > + * chain.  The spec sets no limit; 20s is a generous upper bound, the
> > + * maximum GPF timeout.
> > + */
> > +#define CXL_DC_CHAIN_TIMEOUT	(20 * HZ)
> > +
> >  static const char *cxl_dcd_evt_type_str(u8 type)
> >  {
> >  	switch (type) {
> > @@ -1226,6 +1246,11 @@ static void cxl_dc_chain_abort(struct cxl_memdev_state *mds)
> >  	struct cxl_dc_event_chain *chain = &mds->dc_chain;
> >  	struct device *dev = mds->cxlds.dev;
> >  
> > +	lockdep_assert_held(&chain->lock);
> > +
> > +	chain->armed = false;
> > +	cancel_delayed_work(&chain->timeout_work);
> > +
> >  	if (chain->event_type == DCD_ADD_CAPACITY &&
> >  	    cxl_send_dc_response(mds, CXL_MBOX_OP_ADD_DC_RESPONSE,
> >  				 &chain->pending_extents, 0))
> > @@ -1234,6 +1259,43 @@ static void cxl_dc_chain_abort(struct cxl_memdev_state *mds)
> >  	clear_pending_extents(mds);
> >  }
> >  
> > +static void cxl_dc_chain_timeout(struct work_struct *work)
> > +{
> > +	struct cxl_dc_event_chain *chain = container_of(to_delayed_work(work),
> > +							struct cxl_dc_event_chain,
> > +							timeout_work);
> > +	struct cxl_memdev_state *mds = container_of(chain,
> > +						    struct cxl_memdev_state,
> > +						    dc_chain);
> > +	struct device *dev = mds->cxlds.dev;
> > +
> > +	guard(mutex)(&chain->lock);
> > +
> > +	/*
> > +	 * handle_dcd_chain_event() cancels this work non-synchronously (a sync
> > +	 * cancel would deadlock on @chain->lock, which the chain-close path
> > +	 * holds), so a callback that already started running can reach here
> > +	 * after its chain has moved on.  Abort only if a chain is still armed
> > +	 * AND the timer has not been re-armed since this expiry fired: a new
> > +	 * chain's queue_delayed_work() makes delayed_work_pending() true,
> > +	 * meaning this expiry belongs to a superseded deadline and must not
> > +	 * abort the current chain.
> > +	 */
> > +	if (!chain->armed || delayed_work_pending(&chain->timeout_work))
> > +		return;
> > +
> > +	dev_warn(dev, "DC %s chain timed out\n",
> > +		 cxl_dcd_evt_type_str(chain->event_type));
> > +	cxl_dc_chain_abort(mds);
> > +}
> > +
> > +static void cxl_cancel_dcd_chain_work(void *_mds)
> > +{
> > +	struct cxl_memdev_state *mds = _mds;
> > +
> > +	cancel_delayed_work_sync(&mds->dc_chain.timeout_work);
> > +}
> > +
> >  static int stage_pending_extent(struct list_head *pending,
> >  				struct cxl_extent *to_add)
> >  {
> > @@ -1260,6 +1322,8 @@ static int handle_dcd_chain_event(struct cxl_memdev_state *mds,
> >  	struct device *dev = mds->cxlds.dev;
> >  	int rc;
> >  
> > +	guard(mutex)(&chain->lock);
> > +
> >  	/* Chained records share one event type (CXL r4.0 Table 8-229) */
> >  	if (list_empty(&chain->pending_extents)) {
> >  		chain->event_type = event->event_type;
> > @@ -1279,9 +1343,22 @@ static int handle_dcd_chain_event(struct cxl_memdev_state *mds,
> >  
> >  	if (event->flags & CXL_DCD_EVENT_MORE) {
> >  		dev_dbg(dev, "more bit set; delay processing of extent\n");
> > +		/* The deadline is fixed when the chain opens, not per record */
> > +		if (!chain->armed) {
> > +			queue_delayed_work(system_wq, &chain->timeout_work,
> > +					   CXL_DC_CHAIN_TIMEOUT);
> > +			chain->armed = true;
> > +		}
> >  		return 0;
> >  	}
> >  
> > +	/*
> > +	 * Chain is closing.  Disarm before flushing so a pending watchdog
> > +	 * (queued but blocked on @chain->lock) sees !armed and bails out.
> > +	 */
> > +	chain->armed = false;
> > +	cancel_delayed_work(&chain->timeout_work);
> > +
> >  	/* Nothing is tracked yet: refuse every add, acknowledge every release */
> >  	if (event->event_type == DCD_ADD_CAPACITY)
> >  		rc = cxl_send_dc_response(mds, CXL_MBOX_OP_ADD_DC_RESPONSE,
> > @@ -2021,7 +2098,14 @@ struct cxl_memdev_state *cxl_memdev_state_create(struct device *dev, u64 serial,
> >  
> >  	mutex_init(&mds->event.log_lock);
> >  	INIT_LIST_HEAD(&mds->dc_chain.pending_extents);
> > +	mutex_init(&mds->dc_chain.lock);
> > +	INIT_DELAYED_WORK(&mds->dc_chain.timeout_work, cxl_dc_chain_timeout);
> >  
> > +	/*
> > +	 * The watchdog cancel is registered later, by cxl_enumerate_cmds(), so
> > +	 * devm's reverse-order unwind cancels (and waits for) the watchdog
> > +	 * before this list cleanup runs.
> > +	 */
> >  	rc = devm_add_action_or_reset(dev, clear_pending_extents, mds);
> >  	if (rc)
> >  		return ERR_PTR(rc);
> > diff --git a/drivers/cxl/cxlmem.h b/drivers/cxl/cxlmem.h
> > index c88de7cb65d1..52c936ec15a9 100644
> > --- a/drivers/cxl/cxlmem.h
> > +++ b/drivers/cxl/cxlmem.h
> > @@ -8,6 +8,8 @@
> >  #include <linux/uuid.h>
> >  #include <linux/node.h>
> >  #include <linux/list.h>
> > +#include <linux/mutex.h>
> > +#include <linux/workqueue.h>
> >  #include <cxl/event.h>
> >  #include <cxl/mailbox.h>
> >  #include "cxl.h"
> > @@ -431,6 +433,11 @@ static inline struct cxl_dev_state *mbox_to_cxlds(struct cxl_mailbox *cxl_mbox)
> >   * struct cxl_dc_event_chain - staged Dynamic Capacity event chain
> >   * @pending_extents: extents received so far; flushed when the chain
> >   *		     closes (More=0)
> > + * @timeout_work: watchdog that fires if a chain is opened with
> > + *		  CXL_DCD_EVENT_MORE but the closing record never arrives
> > + * @lock: serialises updates to the chain state against the watchdog
> > + * @armed: set when a More=1 chain opens; cleared when the chain closes
> > + *	   (More=0), is aborted by cxl_dc_chain_abort(), or times out.
> >   * @event_type: DCD event type of the open chain (add or release)
> >   *
> >   * The records of one Dynamic Capacity operation can be chained by the
> > @@ -439,9 +446,17 @@ static inline struct cxl_dev_state *mbox_to_cxlds(struct cxl_mailbox *cxl_mbox)
> >   * chain is open at a time.  Both Add Capacity and Release Capacity chains
> >   * are staged here, @event_type says which.  Records are staged until
> >   * More=0, then the chain is processed and responded to as a whole.
> > + *
> > + * If a chain is opened (More=1) but the device never sends the closing
> > + * record, the staged list would otherwise sit indefinitely.  @timeout_work
> > + * is a defensive watchdog that drops such a chain: an add is refused with
> > + * an empty response, a release is held for the device to retry.
> >   */
> >  struct cxl_dc_event_chain {
> >  	struct list_head pending_extents;
> > +	struct delayed_work timeout_work;
> > +	struct mutex lock;	/* chain state, against the watchdog */
> > +	bool armed;
> >  	u8 event_type;
> >  };
> >  
> 
